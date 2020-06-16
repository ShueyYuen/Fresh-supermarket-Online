from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from filetype import filetype

from Fresh_market_online.model import User
from LoginAPI.token_module import get_token, out_token
import json


# Create your views here.
@csrf_exempt
def PictureGet(request):
    token = request.POST.get("token")
    size = request.POST.get("size")
    referer = str(request.GET.get())
    user = User.objects.filter(token=token)
    if user:
        user = user.values()[0]
        telephone = user['phone']
        if out_token(telephone, token):
            path = r'./static/goods_pic/' + referer
            avatar = open(path, "rb")
            return HttpResponse(avatar.read(), content_type='image/png')
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)