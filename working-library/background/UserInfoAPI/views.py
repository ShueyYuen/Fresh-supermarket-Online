from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from Fresh_market_online.model import User
import json
from django_redis import get_redis_connection
from LoginAPI.token_module import get_token,out_token
@csrf_exempt
def InfoGet(request):
    token = request.POST.get("token")
    user = User.objects.filter(token=token)
    if user:
        user=user.values()[0]
        telephone = user['phone']
        if out_token(telephone, token):
            nickname = user['nickname']
            sex = user['sex']
            data = {"nickname": str(nickname), "phone": str(telephone), "sex": str(sex),"user_id":str(user['user_id']),
                   "token":token,"head_image_id":user["head_image_id"],"money":user["money"]}
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
    original_password=request.POST.get('original_password')
    password = request.POST.get("password")
    sex = request.POST.get("sex")
    print(token,nickname,password,sex)
    user = User.objects.filter(token=token)
    if user:
        user=user.values()[0]
        phone=user['phone']
        if out_token(phone, token):
            if password != None:
                if original_password!=user['password']:
                    return HttpResponse(json.dumps({"message":"密码错误"}))
                User.objects.filter(user_id=user['user_id']).update(password=password)
            if nickname != None:
                User.objects.filter(user_id=user['user_id']).update(nickname=nickname)
            if sex != None:
                User.objects.filter(user_id=user['user_id']).update(sex=sex)

            data = {"success": True}
            response = json.dumps(data)
            print(response)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)
