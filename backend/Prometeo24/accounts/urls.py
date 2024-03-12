from django.urls import path, include
from .views import PreRegisterView, CustomUserViewSet, CampusAmbassadorViewSet 
from rest_framework import routers
from rest_framework.routers import DefaultRouter
router=routers.DefaultRouter()


urlpatterns = [
    path(r'',include(router.urls)), 
    path("preregister/", PreRegisterView.as_view(), name="PreRegistration"),
    path("signup/", CustomUserViewSet.as_view(), name="SignUp"),
    path('campusambassador/', CampusAmbassadorViewSet.as_view(), name='CampusAmbassador' ),
    ]