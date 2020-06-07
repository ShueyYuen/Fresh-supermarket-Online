from django.conf.urls import url
from . import views

urlpatterns = [
    url('api/user/order/detail', views.OrderDetails),
    url('api/user/order/submit', views.OrderSubmit),
    url('api/user/order/list', views.OrderList),
]
