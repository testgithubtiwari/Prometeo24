from django.contrib import admin
from import_export.admin import ImportExportModelAdmin
from .models import Updates

# Register your models here.

admin.site.register(Updates)
