from django.urls import path 

from .views import FAQItemList,FAQItemDetail

urlpatterns=[
    path('faq/', FAQItemList.as_view(), name='FAQ List'),
    path('faq/<int:pk>/', FAQItemDetail.as_view(), name='FAQ Detail'),
]