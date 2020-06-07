from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from Fresh_market_online.model import User, Goods, Order, OrderDetail, Deliveryman, Address
import json
from LoginAPI.token_module import get_token,out_token
@csrf_exempt
def OrderDetail(request):
    token = request.POST.get("token")
    oid = request.POST.get("order_id")
    user = User.objects.filter(token=token)
    if user:
        user=user.values()[0]
        telephone = user['phone']
        if out_token(telephone, token):
            order=Order.objects.filter(order_id=order_id)
            data=[]
            if order:
                for item in order.values():
                    user=User.objects.filter(customer_id=item['custome_id']).values()[0]
                    addr=Address.objects.filter(customer_id=item['customer_id'])

                    phone,sex,nickname=user['phone'],user['sex'],user['nickname']
                    customer={'phone':phone,'sex':sex,'nickname':nickname}
                    address={'address_id':addr['address_id'],'person':{'consignee':addr['consignee'],'sex':addr['consignee_sex']},'phone':addr['consignee_phone']}
                    detail={'province':addr['province'],'city':addr['city'],'district':addr['district'],'street':addr['street'],'house_no':addr['house_no'],'longitude':addr['longitude'],'latitude':addr['latitude'],'tag':addr['tag']}

                    orderdetail=OrderDetail.objects.filter(id=order['order_id']).values()
                    product_list=[]
                    total_price=0
                    for ODitem in orderdetail:
                        gid=ODitem['goods_id']
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

                        product={"product_name": str(product_name), "product_id": str(product_id), "price": price,
                                "picture_list": picture_list, "details": details, "stock": stock, "discount": discount,
                                "description": description, "tags": tags}
                        product_list.append({'product':product,'number':ODitem['quantity']})
                        total_price+=price*ODitem['quantity']

                    dman=Deliveryman.objects.filter(deliveryman_id=order['deliveryman_id']).values()[0]
                    duser=User.objects.filter(user_id=order['deliveryman_id']).values()[0]
                    deliveryman={'deliveryman_id':dman['deliveryman_id'],'name':duser['name'],'phone':duser['phone'],'sex':duser['sex'],'longitude':0,'latitude':0,'status':dman['taking_status']}

                    data.append({'order_id':order_id,'customer':customer,'address':address,'person':person,'detail':detail,'product_list':product_list,'deliveryman':deliveryman,
                                'create_order_time':order['create_order_time'],'receive_order_time':order['receive_order_time'],'finish_order_time':order['finish_order_time'],
                                'order_status':order['order_status'],'payment_id':order['payment_id'],'total_price':total_price})

            return HttpResponse(json.dumps(data))
    return HttpResponse(json.dumps({'message':'登录过期或用户名不存在'}))
