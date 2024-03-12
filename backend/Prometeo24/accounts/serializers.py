from rest_framework import serializers
from .models import PreRegister, CustomUser 
from django.core.mail import get_connection, EmailMultiAlternatives
from django.template.loader import render_to_string
from django.utils.html import strip_tags
import uuid
from django.conf import settings

class PreRegistrationSerializer(serializers.ModelSerializer):
    class Meta:
        model = PreRegister
        fields = "__all__"


class CustomUserSerializers(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        # fields = '__all__'
        extra_kwargs = {'password' : {'write_only' : True}, 'registration_id':{'read_only':True}, 'invite_referral':{'read_only':True}, 'isProfileCompleted':{'read_only':True}, 'ca_count':{'read_only':True}}
        exclude=['groups', 'user_permissions', 'is_superuser', 'is_staff', 'is_active', 'date_joined', 'last_login', 'registration_id', 'referred_by', 'isProfileCompleted','ca_count','pass_type',]