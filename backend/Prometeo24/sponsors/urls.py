from django.urls import path 
from .views import SponsorsView 


urlpatterns=[
   path("sponsors/", SponsorsView.as_view(), name="PreRegistration"),
]