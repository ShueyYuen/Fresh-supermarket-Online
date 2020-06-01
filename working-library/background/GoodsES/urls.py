from django.conf.urls import url
from . import views

urlpatterns = [
    url('api/product/search', views.GoodsSearch),
    url('api/product/history', views.GetHistory)
]