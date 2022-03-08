from django.urls import include, path
from rest_framework import routers
from backend_api.views import PersonViewSet

router = routers.DefaultRouter()
router.register(r'person', PersonViewSet)

urlpatterns = [
    path('', include(router.urls))
]
