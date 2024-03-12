from django.contrib.auth.models import AbstractUser
from django.db import models
from events.models import Event
from .manager import UserManager

GENDER_CHOICES = (
    ("Male", "Male"),
    ("Female", "Female"),
    ("NotSay", "NotSay"),
    ("Other", "Other"),
)

YEAR_CHOICES = (
    ("1", "1st Year"),
    ("2", "2nd Year"),
    ("3", "3rd Year"),
    ("4", "4th Year"),
    ("5", "5th Year"),
    ("6", "Graduated"),
    ("7", "Faculty/Staff"),
    ("8", "NA"),
)


class PreRegister(models.Model):
    name = models.CharField(max_length=100,blank=False,null=False)
    email = models.EmailField(max_length=100, unique=True, primary_key=True,blank=False,null=False)
    college = models.CharField(max_length=100)
    contact = models.CharField(max_length=10,blank=False,null=False)
    year = models.CharField(max_length=100, choices=YEAR_CHOICES, default="1")
    state = models.CharField(max_length=100)
    city = models.CharField(max_length=100, default="")
    gender = models.CharField(max_length=100, choices=GENDER_CHOICES, default="Male")
    isCA=models.BooleanField(default=False, null=True, blank=True)

    def __str__(self):
        return self.email

class CustomUser(AbstractUser):
    username = None
    email = models.EmailField(unique=True, blank=False, null=False, verbose_name='Email',default='testing_email')
    USERNAME_FIELD = 'email'
    first_name = models.CharField(max_length=100, verbose_name='First Name', blank=True, null=True)
    last_name = models.CharField(max_length=100, verbose_name='Last Name', blank=True, null=True)
    events = models.ManyToManyField(Event, blank=True, related_name="participants")
    referred_by = models.ForeignKey('self', on_delete=models.CASCADE, related_name='referred_users', null=True, blank=True)
    invite_referral = models.CharField(max_length=8, null=True, blank=True, verbose_name='Referral Code for Inviting')
    gender = models.CharField(max_length=10, choices=GENDER_CHOICES, verbose_name='Gender', default='Male', blank=True, null=True)
    contact = models.CharField(max_length=10, verbose_name='Contact', blank=True, null=True)
    current_year = models.CharField(max_length=20, choices=YEAR_CHOICES, verbose_name='Current Year of Study', default='1', )
    college = models.CharField(max_length=60, verbose_name='College Name', blank=True, null=True)
    city = models.CharField(max_length=40, verbose_name='City', blank=True, null=True)
    ambassador = models.BooleanField(verbose_name='Campus Ambassador', default=False, blank=True)
    accomodation = models.BooleanField(verbose_name='Accomodation', default=False, blank=True)
    isProfileCompleted = models.BooleanField(verbose_name='Is Profile Completed', default=False, blank=False)
    created_at = models.DateTimeField(auto_now_add=True,blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    pass_type = models.IntegerField(default=0)
    secondary_email = models.EmailField(blank=True, null=True, verbose_name='Secondary Email')
    referral_code = models.CharField(max_length=8, null=True, blank=True, verbose_name='Referral Code')
    ca_count = models.IntegerField(default=0)
    registration_id = models.CharField(max_length=9, unique=True, null=True, blank=True, verbose_name='Registration ID') 
    objects = UserManager()
    REQUIRED_FIELDS = []

    def __str__(self):
        return self.email
    