"""Fresh_market_online URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^', include('CodeAPI.urls')),
    url(r'^', include('LoginAPI.urls')),
    url(r'^', include('UserInfoAPI.urls')),
    url(r'^', include('GoodsAPI.urls')),
    url(r'^', include('AddressAPI.urls')),
    url(r'^', include('CartAPI.urls')),
    url(r'^', include('LogoffAPI.urls')),
    url(r'^', include('AvatarAPI.urls')),
    url(r'^', include('PictureAPI.urls')),
    url(r'^', include('GoodsES.urls')),
    url(r'^', include('OrderAPI.urls')),
]
