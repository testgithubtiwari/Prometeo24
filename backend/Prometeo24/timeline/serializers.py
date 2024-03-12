# serializers.py
from rest_framework import serializers
from .models import TimeLine

class TimeLineSerializer(serializers.ModelSerializer):
    class Meta:
        model = TimeLine
        fields = '__all__'
