from django.db import models

# Create your models here.

GALLERY_ITEM_TYPE = (
    ("image", "image"),
    ("video", "video"),
)


class Gallery(models.Model):
    name = models.CharField(max_length=50)
    description = models.CharField(max_length=1000, null=True, blank=True)
    type = models.CharField(max_length=10, choices=GALLERY_ITEM_TYPE, default="image")
    image = models.ImageField(
        upload_to="gallery/images/", null=True, blank=True, verbose_name="Image file"
    )
    video = models.URLField(
        null=True,
        blank=True,
        verbose_name="Upload video on Youtube and paste link here (NOTE: If video, then also upload image for thumbnail)",
    )
    rank = models.IntegerField(blank=False, null=False, default=1)
    hidden = models.BooleanField(verbose_name="Hide", default=False, blank=True)
