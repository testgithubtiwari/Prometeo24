from rest_framework.views import APIView
from rest_framework import viewsets
from rest_framework.response import Response
from django_filters import rest_framework as filters
from .models import Event, Contacts, EventSponsors, Panel
from .serializers import EventSerializers, ContactsSerializers, EventSponsorsSerializers, PanelSerializers


# Create your views here.
class EventViewSet(viewsets.ModelViewSet):
    queryset = Event.objects.filter(hidden=False).order_by('rank')
    serializer_class = EventSerializers
    filter_backends = [filters.DjangoFilterBackend]
    filterset_fields = ['type','id','rank']
    http_method_names = ['get']
    
class ContactsView(APIView):
    serializer_class = ContactsSerializers
    queryset = Contacts.objects.all()
    def get(self,request):
        allcontacts=Contacts.objects.all().values()
        return Response({"Message":"List of Contacts","allcontacts":allcontacts})

class PanelView(APIView):
    queryset = Panel.objects.all()
    serializer_class = PanelSerializers
    def get(self,request):
        allpanel=Panel.objects.all().values()
        return Response({"Message":"List of Panels","allPanel":allpanel})
    

class EventSponsorsView(APIView):
    queryset = EventSponsors.objects.all()
    serializer_class = EventSponsorsSerializers
    def get(Self,request):
        allEventSponsors=EventSponsors.objects.all().values()
        return Response({"Message":"List of EventSponsors","allEventSponsors":allEventSponsors})
    filter_backends = [filters.DjangoFilterBackend]
    filterset_fields = ['event']