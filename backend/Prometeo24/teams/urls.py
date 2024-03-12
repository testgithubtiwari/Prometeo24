from django.urls import path
from .views import TeamView, PastTeamView

urlpatterns = [
    path("current-team/", TeamView.as_view(), name="Team"),
    path("past-team/", PastTeamView.as_view(), name="PastTeam"),
]