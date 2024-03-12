from django.urls import path 
from .views import TimeLineListCreateView


urlpatterns=[
   path("timelines/", TimeLineListCreateView.as_view(), name="TimeLine"),
]