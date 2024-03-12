from django.db import models
from ckeditor.fields import RichTextField

# from prometeo.settings import AUTH_USER_MODEL

# Create your models here.
EVENT_CHOICES = (
    ("technical", "Technical"),
    ("workshop", "Workshop"),
    ("informal", "Informal"),
    ("exhibition", "Exhibition"),
    ("talk", "Talk"),
    ("panel_discussion", "Panel Discussion"),
    ("initiative", "Initiative"),
    ("entrepreneurial", "Entrepreneurial"),
    ("poster_presentation", "Poster Presentation"),
    
)

EVENT_PARTICIPATION = (
    ("individual", "Individual Event"),
    ("team", "Team Event"),
)


class Event(models.Model):
    name = models.CharField(
        max_length=300, verbose_name="Event Name", unique=True, blank=False, null=False
    )
    speaker = models.CharField(
        max_length=50,
        null=True,
        blank=True,
        verbose_name="If Talk mention speaker's name (Else leave empty)",
    )
    designation = models.CharField(
        max_length=200,
        null=True,
        blank=True,
        verbose_name="Speaker Designation (only for Talk)",
    )
    image = models.ImageField(
        upload_to="images/",
        verbose_name="Cover Image(prefer uploading square images)(for speakers upload images with more padding, i.e, face in the center)",
        blank=False,
        null=False,
    )
    rulebook = models.FileField(
        upload_to="rulebooks/", null=True, blank=True, verbose_name="Rulebook File"
    )
    problem_statement = RichTextField(max_length=5000000, null=True, blank=True, verbose_name="Problem Statement")
    sponsor_image1 = models.ImageField(
        upload_to="images/",
        blank=True,
        verbose_name="Sponser Image 1(upload rectangular images)",
    )
    sponsor_website = models.URLField(
        max_length=1000, null=True, blank=True, verbose_name="Link to Sponsors Website"
    )
    participation_type = models.CharField(
        max_length=25,
        choices=EVENT_PARTICIPATION,
        default="individual",
        verbose_name="Participation Type",
    )
    min_team_size = models.IntegerField(
        verbose_name="Minimum Team Size (leave unchanged for individual event)",
        default=1,
    )
    max_team_size = models.IntegerField(
        verbose_name="Maximum Team Size (leave unchanged for individual event)",
        default=1,
    )
    prize = models.CharField(
        max_length=200,
        verbose_name="Prize Money (Rs.)",
        null=True,
        blank=True,
        default="Prize <Enter prize money here> INR",
    )
    description = models.TextField(
        max_length=5000,
        null=True,
        blank=True,
        verbose_name="Event Description (not for Poster Presentation)",
    )
    poster_description = RichTextField(max_length=5000, null=True, blank=True, verbose_name="Poster Presentation Description")
    host = models.CharField(
        max_length=50, null=True, blank=True, verbose_name="Event Host"
    )
    external_link = models.URLField(
        max_length=500,
        null=True,
        blank=True,
        verbose_name="External Link for Registration",
    )
    date = models.DateField(
        verbose_name="Event Date (Leave unchanged if the date is not decided)",
        null=False,
        blank=False,
        default="2023-01-01",
    )
    time = models.TimeField(null=False, blank=False, verbose_name="Event Time")
    end_date = models.DateField(
        verbose_name="Event end Date", null=False, blank=False, default="2023-01-01"
    )
    end_time = models.TimeField(null=False, blank=False, verbose_name="Event end Time")
    venue = models.CharField(
        max_length=50, null=True, blank=True, verbose_name="Event Venue"
    )
    registration_open = models.BooleanField(
        verbose_name="Registrations Open", default=True, blank=True
    )
    type = models.CharField(
        max_length=30, choices=EVENT_CHOICES, default="event", verbose_name="Event Type"
    )
    event_started = models.BooleanField(
        verbose_name="Event started", default=False, blank=True
    )
    meet_link = models.URLField(
        max_length=500, null=True, blank=True, verbose_name="meet Link for streaming"
    )
    youtube_link = models.URLField(
        max_length=500, null=True, blank=True, verbose_name="youtube Link for streaming"
    )
    webx_link = models.URLField(
        max_length=500, null=True, blank=True, verbose_name="webX Link for streaming"
    )
    featured = models.BooleanField(
        verbose_name="Display on home page", default=False, blank=True
    )
    rank = models.IntegerField(blank=False, null=False, default=1)
    hidden = models.BooleanField(verbose_name="Hide Event", default=False, blank=True)
    presentation_template = models.URLField(
        verbose_name="presentation template download link for poster presentations",
        blank=True,
        null=True,
    )
    sample_poster = models.URLField(
        verbose_name="sample poster download link for poster presentations",
        blank=True,
        null=True,
    )
    submissions_started = models.BooleanField(
        verbose_name="User can upload their submissions", default=False, blank=True
    )
    submission_link = models.URLField(
        max_length=500, null=True, blank=True, verbose_name="Event submission link"
    )
    material_name = models.CharField(
        max_length=100, null=True, blank=True, verbose_name="Material Name"
    )
    material = models.FileField(
        upload_to="supplementaryMaterials/",
        null=True,
        blank=True,
        verbose_name="Supplementary Material",
    )

    # poc = models.ForeignKey(AUTH_USER_MODEL, on_delete=models.CASCADE, null=True, blank=True, verbose_name="Point of Contact")

    def __str__(self):
        return self.name

class Contacts(models.Model):
    event = models.ForeignKey(Event, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    phone = models.CharField(max_length=10)
    
class Panel(models.Model):
    event = models.ForeignKey(Event, on_delete=models.CASCADE, related_name='panel')
    name = models.CharField(max_length=50)
    designation = models.CharField(max_length=50)
    image = models.ImageField(upload_to="images/panelist/", verbose_name="Panelist image")
    
class EventSponsors(models.Model):
    event = models.ForeignKey(Event, on_delete=models.CASCADE, related_name="event_sponsors")
    name = models.CharField(max_length=100, null=True, blank=True, verbose_name="Name")
    image = models.ImageField(upload_to="images/sponsors/", null=True, blank=True, verbose_name="Sponser Image (upload rectangular images)")
    website = models.URLField(max_length=1000, null=True, blank=True, verbose_name="Link to Sponsors Website")