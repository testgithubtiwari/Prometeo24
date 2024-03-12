from django.shortcuts import render

# Create your views here.
from rest_framework import generics
from .models import Updates
from .serializers import UpdatesSerializer

class UpdatesListCreateView(generics.ListCreateAPIView):
    queryset = Updates.objects.all()
    serializer_class = UpdatesSerializer

    def perform_create(self, serializer):
        serializer.save()

    def get_queryset(self):
        updatestype = self.request.query_params.get('updatestype', None)
        if updatestype in [Updates.EVENT, Updates.APP]:
            return Updates.objects.filter(updatestype=updatestype)
        return Updates.objects.all()
