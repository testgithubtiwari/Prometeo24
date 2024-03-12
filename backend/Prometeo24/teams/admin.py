from django.contrib import admin
from import_export.admin import ImportExportModelAdmin
from .models import Designation, Team, PastTeam


@admin.register(Team)
class TeamAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    list_display = ["name", "vertical", "email", "phoneNo"]

    class Meta:
        model = Team
        fields = "__all__"


@admin.register(PastTeam)
class PastTeamAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    list_display = ["name", "vertical", "email", "phoneNo"]

    class Meta:
        model = PastTeam
        fields = "__all__"


@admin.register(Designation)
class DesignationAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    list_display = [
        "designationName",
    ]

    class Meta:
        model = Designation
        fields = "__all__"