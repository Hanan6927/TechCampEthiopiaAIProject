from datetime import datetime
from django.db import models

from users.models import User
from django.core.validators import MaxValueValidator, MinValueValidator 

# Create your models here.
def upload_to(instance, filename):
    return '{datetime}{filename}'.format(datetime=datetime.now(), filename=filename)

class Plant(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    plant_name = models.CharField(max_length=255)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, unique=False)
    
    plant_pic = models.ImageField(
        upload_to=upload_to, default='media\channel.png')
    likes = models.PositiveIntegerField(validators=[MinValueValidator(0)], default=0)

class PrdeictPlant(models.Model):
    plant_pic = models.ImageField(
        upload_to="plants", default='media\channel.png')