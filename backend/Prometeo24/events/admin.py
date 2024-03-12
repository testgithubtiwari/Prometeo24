from django.contrib import admin
from .models import Event, Contacts, Panel, EventSponsors
from import_export.admin import ImportExportModelAdmin

# Register your models here.

class ContactsAdmin(admin.StackedInline):
    model = Contacts


class PanelAdmin(admin.StackedInline):
    model = Panel


class EventSponsorsAdmin(admin.StackedInline):
    model = EventSponsors


class EventAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    list_display = ('name', 'date', 'time', 'venue', 'registration_open', 'type')
    list_filter = ('type', 'registration_open')
    search_fields = ['name']
    inlines = [ContactsAdmin, PanelAdmin, EventSponsorsAdmin]
    fieldsets = (
        (('Event Details'), {'fields': ('name', 'type', 'speaker', 'designation', 'description', 'prize', 'external_link', 'venue', 'featured', 'rank', 'hidden', 'submissions_started')}),
        (('Event Registration Details'), {'fields': ('participation_type', 'min_team_size', 'max_team_size', 'registration_open', 'submission_link')}),
        (('Event Dates'), {'fields': ('date', 'time', 'end_date', 'end_time', 'event_started')}),
        (('Event Links'), {'fields': ('meet_link', 'youtube_link', 'webx_link')}),
        (('Event Uploads'), {'fields': ('image', 'rulebook', 'material_name', 'material', 'problem_statement')}),
        (('Poster Presentations'), {'fields': ('sample_poster', 'presentation_template', 'poster_description')}),
    )
    
    
admin.site.register(Event, EventAdmin)