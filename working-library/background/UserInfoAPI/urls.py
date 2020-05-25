from django.conf.urls import url
from . import views

urlpatterns = [
    url('api/user/info/get', views.InfoGet),
    url('api/user/info/set', views.InfoSet)
]
