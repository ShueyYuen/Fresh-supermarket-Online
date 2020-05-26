from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from UserInfoAPI.models import User
from GoodsAPI.models import Goods
import json
from django_redis import get_redis_connection
from LoginAPI.token_module import get_token,out_token
@csrf_exempt
def Goodsdetail(request):
    token = request.POST.get("token")
    gid = request.POST.get("product_id")
    user = User.objects.filter(token=token).values()[0]
    if user:
        telephone = user['phone']
        if out_token(telephone, token):
            goods = Goods.objects.filter(goods_id=gid).values()[0]

            product_name = goods['goods_name']
            product_id = gid
            price = {"num": goods['price'], "unit": str(goods['unit'])}
            shuffle,detail = getpicture(gid)
            picture_list = {"shuffle": shuffle, "detail": detail}
            details = {"origin": goods['origin'], "specification": goods['specification'],
                       "packaging": goods['packaging'], "stockway": goods['stockway'], "weight": goods['weight']}
            stock = goods['stock']
            discount = goods['discount']
            description = {"subtitle": goods['subtitle'], "distribution": goods['distribution'], "promotion": goods['promotion']}
            tags = {"type": goods['tags_type'], "content": goods['tags_content']}

            data = {"product_name": str(product_name), "product_id": str(product_id), "price": price,
                    "picture_list": picture_list, "details": details, "stock": stock, "discount": discount,
                    "description": description, "tags": tags}
            response = json.dumps(data)
            print(response)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)

def getpicture(id):
    import os
    print(os.getcwd())
    with open('./static/goods_pic/'+id+'.txt',"r",encoding='utf-8') as picture:
        shuffle = picture.readline().strip('\n').split(' ')
        detail = picture.readline().strip('\n').split(' ')
    return shuffle,detail