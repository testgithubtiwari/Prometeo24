from django.contrib import admin
from .models import Gallery
from import_export.admin import ImportExportModelAdmin
# Register your models here.


@admin.register(Gallery)
class GalleryAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    list_display = [
        "name",
        "hidden",
    ]
    list_filter = ("type",)
    search_fields = [
        "name",
    ]
