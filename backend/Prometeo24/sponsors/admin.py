from django.contrib import admin
from .models import Sponsors, SponsorDesignation
from import_export.admin import ImportExportModelAdmin


# Register your models here.
class SponsorsAdmin(admin.StackedInline):
    model = Sponsors


class SponsorsDesignationAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    model = SponsorDesignation
    list_display = ["sponsor_type"]
    inlines = [
        SponsorsAdmin,
    ]

    class Meta:
        model = Sponsors
        fields = "__all__"


admin.site.register(SponsorDesignation, SponsorsDesignationAdmin)