from django.shortcuts import render
from rest_framework import generics
from .models import FAQ
from .serializers import FAQSerializers
# Create your views here.


class FAQItemList(generics.ListCreateAPIView):
    queryset = FAQ.objects.all()
    serializer_class = FAQSerializers

class FAQItemDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = FAQ.objects.all()
    serializer_class = FAQSerializers
