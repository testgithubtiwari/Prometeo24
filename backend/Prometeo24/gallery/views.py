from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import GallerySerializers
from .models import Gallery

# Create your views here.


class GalleryView(APIView):
    serializer_class = GallerySerializers
    queryset = Gallery.objects.all()

    def get(self, request):
        allGallery = Gallery.objects.all().values()
        return Response({"Message": "List of photos and videos", "": allGallery})
