from posixpath import basename
from django.urls import include, path
from rest_framework import views
from rest_framework import routers

from . import views
from rest_framework_nested import routers
from .views import PlantDiseasePridictViewSet, PlantDiseaseViewSet


router = routers.DefaultRouter()
router.register('',views.PlantViewSet)

urlpatterns = [
    path('',include(router.urls)),
    path('by_name/<str:plant_name>/',PlantDiseaseViewSet.as_view()),
    path('predict/image/model/',PlantDiseasePridictViewSet.as_view()),
]
