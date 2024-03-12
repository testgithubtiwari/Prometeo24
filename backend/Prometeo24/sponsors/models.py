from django.db import models


# Create your models here.
class SponsorDesignation(models.Model):
    sponsor_type = models.CharField(max_length=100, verbose_name="Sponsor Type")
    rank = models.IntegerField(verbose_name="hierarchical position of the title")

    def __str__(self):
        return self.sponsor_type


class Sponsors(models.Model):
    designation = models.ForeignKey(SponsorDesignation, on_delete=models.CASCADE)
    image = models.ImageField(upload_to="sponsors/", verbose_name="sponsors Logo")
    name = models.CharField(
        max_length=100, verbose_name="Sponsor name", blank=True, null=True
    )
    sponsor_link = models.URLField(
        max_length=1000, verbose_name="Link to Sponsors website", null=True, blank=True
    )
