from django.conf.urls import url

from . import views

urlpatterns = [
    url('api/avatar/upload', views.AvatarUpload),
    url('api/avatar/load', views.AvatarLoad),
]
