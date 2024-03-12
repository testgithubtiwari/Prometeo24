from django.urls import path
from .views import UpdatesListCreateView

urlpatterns = [
    path("updates/", UpdatesListCreateView.as_view(), name="Updates"),
]