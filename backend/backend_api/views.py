from django.shortcuts import render
from rest_framework import viewsets
from backend_api.serializers import PersonSerializer
from backend_api.models import Person
# Create your views here.
class PersonViewSet(viewsets.ModelViewSet):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer