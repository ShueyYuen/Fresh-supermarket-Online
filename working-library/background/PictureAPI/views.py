from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from filetype import filetype

from Fresh_market_online.model import User
from LoginAPI.token_module import get_token, out_token
import json


# Create your views here.
@csrf_exempt
def PictureGet(request):
    size = request.POST.get("size")
    url=request.path
    end_pos = url.rfind('/') - 1  
    start_pos = url.rfind('/', 0, end_pos)  
    filename = url[start_pos + 1:]
    #print(filename)
    path = r'./static/goods_pic/' + filename
    avatar = open(path, "rb")
    return HttpResponse(avatar.read(), content_type='image/png')