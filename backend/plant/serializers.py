from rest_framework import serializers, fields
from .models import Plant, PrdeictPlant

class PlantSerializer(serializers.ModelSerializer):
    class Meta:
        model = Plant
        fields = ['id','plant_name', 'user_id','plant_pic','likes']
        read_only_fields = ['id']
    def create(self, validated_data):
        if validated_data.get('plant_pic'):
            plant = Plant(plant_name= validated_data['plant_name'], user_id=validated_data['user_id'], plant_pic = validated_data['plant_pic'], likes= validated_data['likes'])
        plant.save()
        return plant

class PredictSerializer(serializers.ModelSerializer):
    class Meta:
        model = PrdeictPlant
        # fields = ['plant_pic']
        fields = "__all__"
    # def create(self, validated_data):
    #     if validated_data.get('plant_pic'):
    #         plant = PrdeictPlant(plant_name= validated_data['plant_name'])
    #     plant.save()
    #     return plant
        