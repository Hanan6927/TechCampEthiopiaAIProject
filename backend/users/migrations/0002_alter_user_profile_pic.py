# Generated by Django 4.0.3 on 2022-03-11 12:22

from django.db import migrations, models
import users.models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='profile_pic',
            field=models.ImageField(blank=True, default='media\\default-user.png', null=True, upload_to=users.models.upload_to),
        ),
    ]
