# Generated by Django 4.0.3 on 2022-03-12 05:54

from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import plant.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Plant',
            fields=[
                ('id', models.PositiveIntegerField(editable=False, primary_key=True, serialize=False)),
                ('plant_name', models.CharField(max_length=255)),
                ('plant_pic', models.ImageField(default='media\\channel.png', upload_to=plant.models.upload_to)),
                ('likes', models.PositiveIntegerField(default=0, validators=[django.core.validators.MinValueValidator(0)])),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]