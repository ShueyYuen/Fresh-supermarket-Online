from django.conf.urls import url

from . import views

urlpatterns = [
    url('api/user/address/list', views.AddressGet),
    url('api/user/address/update', views.AddressUpdate)
]
