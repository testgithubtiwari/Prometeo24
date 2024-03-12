from rest_framework import serializers
from .models import FAQ


#  Important Question Serializer
class FAQSerializers(serializers.ModelSerializer):
    class Meta:
        model = FAQ
        fields = '__all__'
