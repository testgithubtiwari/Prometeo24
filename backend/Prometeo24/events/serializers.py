from rest_framework import serializers
from .models import Event, Contacts, Panel, EventSponsors


class EventSerializers(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = '__all__'
                
class EventSponsorsSerializers(serializers.ModelSerializer):
    class Meta:
        model = EventSponsors
        fields = '__all__'
               
class ContactsSerializers(serializers.ModelSerializer):
    class Meta:
        model = Contacts
        fields = '__all__'
        
class PanelSerializers(serializers.ModelSerializer):
    class Meta:
        model = Panel
        fields = '__all__'