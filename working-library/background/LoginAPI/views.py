from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from Fresh_market_online.model import User
from LoginAPI.token_module import get_token,out_token
import json
from django_redis import get_redis_connection

@csrf_exempt
def Login(request):
    phone = request.POST.get("phone")
    code = request.POST.get("code")
    passwd = request.POST.get("password")
    print(phone,code,passwd)
    if code==None and passwd ==None:
        response=json.dumps({"message":"没有传入密码和验证码"})
        return HttpResponse(response)
    
    if passwd==None:
        redis_code=get_redis_connection()
        print(redis_code.get(phone),code)
        if redis_code.get(phone)==None or redis_code.get(phone).decode('utf-8') != str(code):
            response=json.dumps({"message":"验证码错误或过期"})
            return HttpResponse(response)
    
    user= User.objects.filter(phone=phone)
   #if user.exists()==False:
   #    response=json.dumps({"message":"当前帐号未注册"})
   #    return HttpResponse(response)
    
    if code==None:
        if user.values()[0]['password'] != passwd:
            response=json.dumps({"message":"密码错误"})
            return HttpResponse(response)

    token = get_token(phone, 230400).decode('utf-8')

    if user.exists()==False:
        User.objects.create(phone=phone, token=token, user_type='1', money=1000.0, nickname=str(phone), password='888888888', sex='NULL')
        user= User.objects.filter(phone=phone)

    user.update(token=token)
    user = user.values()[0]
    userId=user['user_id']
    nickname=user['nickname']
    sex = user['sex']
    avatarId=user['head_image_id']
    money=user['money']
    data = {"phone":phone ,"user_id": str(userId), "nickname": str(nickname), "sex": sex ,"token": str(token), "head_image_id": str(avatarId),"money":money}
    response=json.dumps(data)
    print(response)
    return HttpResponse(response)


