import requests
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
import random
from yunpian_python_sdk.model import constant as YC
from yunpian_python_sdk.ypclient import YunpianClient
import datetime
import json
from django_redis import get_redis_connection
templateid='你的模板id'
apikey='你的apikey'
@csrf_exempt
def sendcode(request):
    phone = request.POST.get("phone")
    print(phone)
    
    redis_code=get_redis_connection()
    if redis_code.get(phone) != None:
        response=json.dumps({"message":'短信接口调用频繁'})
        return HttpResponse(response)
    
    code = ''
    for i in range(4):
        num = random.randint(0, 9)
        code += str(num)
    text = '你的短信文本'
    print(text)
    # 初始化client,apikey作为所有请求的默认值
    #clnt = YunpianClient(apikey)
    #param = {YC.MOBILE:phone,YC.TEXT:text}
    #r = clnt.sms().single_send(param)
    #codestatus = r.code()
    
    codestatus=1
    
    if codestatus == 0:
        response=json.dumps({'message':'后台调用短信接口失败'})
        return HttpResponse(response)
    
    time=datetime.datetime.now()
    redis_code.set(phone,code,60*5)
    data={"time":str(time)}
    response = json.dumps(data)
    return HttpResponse(response)

