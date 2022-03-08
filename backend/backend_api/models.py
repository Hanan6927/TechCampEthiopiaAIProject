from django.db import models

# Create your models here.
class Person(models.Model):
   user_id = models.AutoField(primary_key=True, null=False) 
   user_name = models.CharField(max_length=100)
   email = models.CharField(max_length=100)
   password = models.CharField(max_length=100)
   
