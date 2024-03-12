from django.urls import path, include
from .views import EventViewSet, ContactsView, PanelView, EventSponsorsView
from rest_framework import routers
from rest_framework.routers import DefaultRouter
router=routers.DefaultRouter()

router.register("event",EventViewSet)
urlpatterns = [
    # path("event/",EventViewSet.as_view(),name="Event"),
    path(r'',include(router.urls)),
    path("contacts/",ContactsView.as_view(),name="Contacts"),
    path("panel/",PanelView.as_view(),name="Panel"),
    path("eventsponsors/",EventSponsorsView.as_view(),name="EventSponsors")
]