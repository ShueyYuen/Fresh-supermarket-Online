from django.conf.urls import url

from . import views

urlpatterns = [
    url('api/user/cart/add', views.CartAdd),
    url('api/user/cart/update', views.CartUpdate),
    url('api/user/cart/query', views.CartQuery),
]
