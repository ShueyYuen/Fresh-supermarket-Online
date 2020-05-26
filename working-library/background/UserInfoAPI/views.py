from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from UserInfoAPI.models import User
import json
from django_redis import get_redis_connection
from LoginAPI.token_module import get_token,out_token
@csrf_exempt
def InfoGet(request):
    token = request.POST.get("token")
    user = User.objects.filter(token=token).values()[0]
    if user:
        telephone = user['phone']
        if out_token(telephone, token):
            nickname = user['nickname']
            sex = user['sex']
            data = {"nickname": str(nickname), "telephone": str(telephone), "sex": str(sex)}
            response = json.dumps(data)
            print(response)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)


@csrf_exempt
def InfoSet(request):
    token = request.POST.get("token")
    nickname = request.POST.get("nickname")
    password = request.POST.get("password")
    sex = request.POST.get("sex")
    phone = request.POST.get("telephone")

    user = User.objects.filter(phone=phone)
    if user:
        if out_token(phone, token):
            user.update(nickname=nickname, password=password, sex=sex)
            data = {"success": True}
            response = json.dumps(data)
            print(response)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)
