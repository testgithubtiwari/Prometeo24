from django.db import models

# Create your models here.

from django.db import models

class Updates(models.Model):
    EVENT = 'event'
    APP = 'app'

    UPDATETYPE_CHOICES = [
        (EVENT, 'Event'),
        (APP, 'App'),
    ]

    id = models.IntegerField(primary_key=True)
    updatestype = models.CharField(max_length=5, choices=UPDATETYPE_CHOICES)
    news = models.TextField()

    def __str__(self):
        return f"Update ID: {self.id}"
