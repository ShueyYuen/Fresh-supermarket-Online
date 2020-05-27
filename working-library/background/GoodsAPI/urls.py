from django.conf.urls import url
from . import views

urlpatterns = [
    url('api/user/product/detail', views.Goodsdetail),
    url('api/user/product/recommend', views.Goodsrecommend)
]
