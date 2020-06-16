from django.conf.urls import url

from . import views

urlpatterns = [
    url('api/user/ads', views.AdsGet),
]
