from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from UserInfoAPI.models import User
from CartAPI.models import ShoppingCart
import json
from django_redis import get_redis_connection
from LoginAPI.token_module import get_token,out_token
@csrf_exempt
def CartAdd(request):
    token = request.POST.get("token")
    pid = request.POST.get("product_id")
    user = User.objects.filter(token=token)
    if user:
        user=user.values()[0]
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            cart=ShoppingCart.objects.filter(customer_id=uid,goods_id=pid)
            if cart.exists():
                num=cart.values()[0]['quantity']
                cart.update(quantity=num+1)
            else:
                ShoppingCart.objects.create(customer_id=uid,goods_id=pid,quantity=1)
            response = json.dumps({"success":True})
            print(response)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)

@csrf_exempt
def CartUpdate(request):
    token = request.POST.get("token")
    num= int(request.POST.get('number'))
    pid= request.POST.get('product_id')
    user = User.objects.filter(token=token)
    if user:
        user=user.values()[0]
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            cart=ShoppingCart.objects.filter(customer_id=uid,goods_id=pid)
            if cart.exists():
                if num==0:
                    cart.delete()
                else:
                    cart.update(quantity=num)
            elif num!=0:
                ShoppingCart.objects.create(customer_id=uid,goods_id=pid,quantity=num)
            data={'success':True}
            response = json.dumps(data)
            print(response)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)

@csrf_exempt
def CartQuery(request):
    token = request.POST.get("token")
    user = User.objects.filter(token=token).values()[0]
    if user:
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            
            data={'success':True}
            response = json.dumps(data)
            print(response)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)