from rest_framework.views import APIView
from rest_framework.response import Response
from .models import PreRegister, CustomUser
from rest_framework.authentication import TokenAuthentication 
from .serializers import PreRegistrationSerializer, CustomUserSerializers
from rest_framework import permissions, viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework import generics
import uuid
from django.conf import settings
from django.core.mail import get_connection, EmailMultiAlternatives
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from rest_framework import status

# Create your views here.
class PreRegisterView(APIView):
    serializer_class = PreRegistrationSerializer

    def post(self, request):
        serializer_obj = PreRegistrationSerializer(data=request.data)
        
        if  PreRegister.objects.filter(email=request.data['email']).exists():
            return Response({"Message": "PreRegistration already exists with this Email"},status=409)
        if serializer_obj.is_valid():            
            PreRegister.objects.create(
                name=serializer_obj.data.get("name"),
                email=serializer_obj.data.get("email"),
                college=serializer_obj.data.get("college"),
                contact=serializer_obj.data.get("contact"),
                year=serializer_obj.data.get("year"),
                state=serializer_obj.data.get("state"),
                city=serializer_obj.data.get("city"),
                gender=serializer_obj.data.get("gender"),
                isCA=serializer_obj.data.get("isCA"),
                )
            return Response({"Message": "Successfully PreRegistered"})
        else :
            return Response({"Message": "Something went wrong"}, status=400)

class CustomUserViewSet(generics.CreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializers

    def create(self, request, *args, **kwargs):
        # Check if the email is already registered
        email = request.data.get('email')  # Assuming the email field is present in your request data
        if CustomUser.objects.filter(email=email).exists():
            return Response({'detail': 'Email is already registered.'}, status=status.HTTP_409_CONFLICT)

        serializer = CustomUserSerializers(data=request.data)

        if serializer.is_valid():
            user = serializer.save()

            if user:
                user.save()
                id_registration = 'PRO' + str(uuid.uuid4().int)[:4] + str(user.id)[:2]

                while CustomUser.objects.filter(registration_id=id_registration).exists():
                    id_registration = 'PRO' + str(uuid.uuid4().int)[:4] + str(user.id)[:2]

                user.registration_id = id_registration
                user.referral_code = None

                if request.data.get('referral_code') is not None and CustomUser.objects.filter(
                        invite_referral=request.data['referral_code']).exists():
                    ca = CustomUser.objects.get(invite_referral=request.data['referral_code'])
                    user.referred_by = ca
                    user.referral_code = request.data['referral_code']
                    user.ambassador = False
                    ca.ca_count += 1
                    ca.save()
                elif request.data.get('ambassador') is True:
                    user.ambassador = True
                    code = 'CA' + str(uuid.uuid4().int)[:4] + str(user.id)[:2]
                    while CustomUser.objects.filter(invite_referral=code).exists():
                        code = 'CA' + str(uuid.uuid4().int)[:4] + str(user.id)[:2]
                    user.invite_referral = code

                user.save()

                return Response(serializer.data, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
class CampusAmbassadorViewSet(APIView):
    permissions_classes = (IsAuthenticated,)

    def post(self, request):
        user = request.user
        code = 'CA' + str(uuid.uuid4().int)[:4] + str(user.id)[:2]
        while (CustomUser.objects.filter(invite_referral=code).exists()):
            code = 'CA' + str(uuid.uuid4().int)[:4] + str(user.id)[:2]
        user.invite_referral = code
        user.ambassador = True
        user.save()
        return Response({"Message": "Successfully Registered as Campus Ambassador"})

    