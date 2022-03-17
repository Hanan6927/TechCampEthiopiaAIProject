import json
from unittest import result
from django.shortcuts import render
from rest_framework import serializers
from rest_framework.views import APIView
from django.shortcuts import get_object_or_404
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from rest_framework.decorators import action
from rest_framework import filters

from infer.infer import getPridiction


# Create your views here.
from .models import Plant, PrdeictPlant
from plant.serializers import PlantSerializer,PredictSerializer
from rest_framework.permissions import AllowAny, IsAuthenticated, IsAuthenticatedOrReadOnly, IsAdminUser

class PlantViewSet(ModelViewSet):
    queryset = Plant.objects.all()
    serializer_class = PlantSerializer
    filter_backends = (filters.SearchFilter,)

    def get_serializer_context(self):
        return {'request':self.request}

    @action(detail= False, methods=['get'])
    def all_plants(self, request):
        plants = Plant.objects.all()

        serializer = PlantSerializer(plants, many=True)

        return Response(serializer.data)
    @action(detail= False, methods=['get'])
    def get_disease(self, request,plant_name=None):
        plants = self.request.user
        result = Plant.objects.filter(plant_name=plants)

        serializer = PlantSerializer(result, many=True)

        return Response(serializer.data)

class PlantDiseaseViewSet(APIView):
    def get(self, request, plant_name):
        plants = Plant.objects.filter(plant_name=plant_name)
        serializer = PlantSerializer(plants, many=True)

        return Response(serializer.data)

class PlantDiseasePridictViewSet(APIView):
    serializer_class = PredictSerializer
    queryset = PrdeictPlant.objects.all()

    def post(self, request):
        data = request.FILES.get("plant_pic","")
        print(data)
        print("yes here")
        name = request.data
        
        plantt = PrdeictPlant()
        plantt.plant_pic = request.data['file']
        plantt.save()
        print("AND HEREEEE")
        ser = PredictSerializer(plantt)
        # ser.is_valid(raise_exception=True)
        # serializer.save()
        # response = Response(serializer.data)
        print("SerialQQQ")
        plant_path =ser.data['plant_pic']
        # print(plantt.plant_pic.name)
        # plant_path = "media/"+plantt.plant_pic.name
        print(plant_path)
        pred = getPridiction(plant_path)
        # serializer_data = serializer.data
        # return Response({"data":ser.data,"de"})
        
        return Response({"data":ser.data,"disease_name":pred})
