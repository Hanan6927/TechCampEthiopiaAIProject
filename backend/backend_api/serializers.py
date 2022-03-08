from dataclasses import field, fields
from pyexpat import model
from rest_framework import serializers
from backend_api.models import Person

class PersonSerializer(serializers.ModelSerializer):
    class Meta:
        model = Person
        fields = ('user_name','email','password')