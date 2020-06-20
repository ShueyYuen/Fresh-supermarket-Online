from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from Fresh_market_online.model import ShoppingCart,User,Goods
import json
from django_redis import get_redis_connection
from LoginAPI.token_module import get_token,out_token
from GoodsAPI.views import getpicture
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
    print(token)
    user = User.objects.filter(token=token)
    if user:
        user=user.values()[0]
        data=[]
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            cart=ShoppingCart.objects.filter(customer_id=uid).values()
            for item in cart:
                goods = Goods.objects.filter(goods_id=item['goods_id']).values()[0]

                product_name = goods['goods_name']
                product_id = item['goods_id']
                price = {"num": goods['price'], "unit": str(goods['unit'])}
                shuffle,detail = getpicture(item['goods_id'])
                picture_list = {"shuffle": shuffle, "detail": detail}
                details = {"origin": goods['origin'], "specification": goods['specification'],
                           "packaging": goods['packaging'], "stockway": goods['stockway'], "weight": goods['weight']}
                stock = goods['stock']
                discount = goods['discount']
                description = {"subtitle": goods['subtitle'], "distribution": goods['distribution'], "promotion": goods['promotion']}
                tags = {"type": goods['tags_type'], "content": goods['tags_content']}

                data.append({"product":{"product_name": str(product_name), "product_id": str(product_id), "price": price,
                        "picture_list": picture_list, "details": details, "stock": stock, "discount": discount,
                        "description": description, "tags": tags},"number":item['quantity']})
            response = json.dumps(data)
            #print(response)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)