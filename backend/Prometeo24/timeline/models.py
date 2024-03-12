# models.py
from django.db import models

class TimeLine(models.Model):
    id = models.AutoField(primary_key=True)
    eventName = models.CharField(max_length=255)
    startDate = models.DateField()
    startTime = models.TimeField()
    # endDate = models.DateField()
    endTime = models.TimeField()
    venue = models.CharField(max_length=255)

    def __str__(self):
        return self.eventName
