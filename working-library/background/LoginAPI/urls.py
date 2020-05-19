from django.conf.urls import url
from . import views

urlpatterns = [
    url('api/user/login', views.Login)
]
