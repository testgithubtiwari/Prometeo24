# views.py
from rest_framework import generics
from .models import TimeLine
from .serializers import TimeLineSerializer

class TimeLineListCreateView(generics.ListCreateAPIView):
    queryset = TimeLine.objects.all()
    serializer_class = TimeLineSerializer

class TimeLineRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = TimeLine.objects.all()
    serializer_class = TimeLineSerializer
