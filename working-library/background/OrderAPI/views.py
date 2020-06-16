import datetime

from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from Fresh_market_online.model import User, Goods, Order, OrderDetail, Deliveryman, Address, ShoppingCart
import json
from LoginAPI.token_module import get_token,out_token
from GoodsAPI.views import getpicture
@csrf_exempt
def OrderDetails(request):
    token = request.POST.get("token")
    oid = request.POST.get("order_id")
    user = User.objects.filter(token=token)
    if user:
        user=user.values()[0]
        telephone = user['phone']
        if out_token(telephone, token):
            order=Order.objects.filter(order_id=oid)
            data=[]
            if order:
                for item in order.values():
                    user=User.objects.filter(user_id=item['customer_id']).values()[0]
                    addr=Address.objects.filter(customer_id=item['customer_id']).values()[0]

                    phone,sex,nickname=user['phone'],user['sex'],user['nickname']
                    customer={'phone':phone,'sex':sex,'nickname':nickname}
                    address={'address_id':addr['address_id'],'person':{'consignee':addr['consignee'],'sex':addr['consignee_sex']},'phone':addr['consignee_phone']}
                    detail={'province':addr['province'],'city':addr['city'],'district':addr['district'],'street':addr['street'],'house_no':addr['house_no'],'longitude':addr['longitude'],'latitude':addr['latitude'],'tag':addr['tag']}

                    orderdetail=OrderDetail.objects.filter(order_id=item['order_id']).values()
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
                        total_price += (goods['price']*ODitem['quantity'])


                    dman=Deliveryman.objects.filter(deliveryman_id=item['deliveryman_id']).values()[0]
                    duser=User.objects.filter(user_id=item['deliveryman_id']).values()[0]
                    deliveryman={'deliveryman_id':dman['deliveryman_id'],'name':duser['nickname'],'phone':duser['phone'],'sex':duser['sex'],'longitude':'30.915406','latitude':'121.479650','status':dman['taking_status']}

                    data.append({'order_id':oid,'customer':customer,'address':address,'detail':detail,'product_list':product_list,'deliveryman':deliveryman,
                                'create_order_time':str(item['create_order_time']),'receive_order_time':str(item['receive_order_time']),'finish_order_time':str(item['finish_order_time']),
                                'order_status':item['order_status'],'payment_id':item['payment_id'],'total_price':total_price})

            return HttpResponse(json.dumps(data))
    return HttpResponse(json.dumps({'message':'登录过期或用户名不存在'}))
@csrf_exempt
def OrderSubmit(request):
    token = request.POST.get("token")
    user = User.objects.filter(token=token)
    if user:
        user = user.values()[0]
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            goods_list =eval(request.POST.get("orders"))
            adderss_id = request.POST.get("address_id")
            create_order_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            order_status = '1'
            warehouse_id = '01'
            Order.objects.create(customer_id=uid, deliveryman_id=uid, create_order_time=create_order_time,
                                         order_status=order_status, warehouse_id=warehouse_id,
                                         address_id=int(adderss_id))
            order=Order.objects.filter(customer_id=uid, deliveryman_id=uid, create_order_time=create_order_time,
                                         order_status=order_status, warehouse_id=warehouse_id,
                                         address_id=int(adderss_id)).values()[0]
            id = order['order_id']
            for item in goods_list:
                goods = ShoppingCart.objects.filter(customer_id=uid, goods_id=item).values()[0]

                quantity = goods['quantity']
                OrderDetail.objects.create(order_id=id,goods_id=item,quantity=quantity)

            data = {"order_id": id}
            response = json.dumps(data)
            return HttpResponse(response)

    return HttpResponse(json.dumps({'message': '登录过期或用户名不存在'}))

@csrf_exempt
def OrderList(request):
    token = request.POST.get("token")
    user = User.objects.filter(token=token)
    if user:
        user = user.values()[0]
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            data = []
            type = request.POST.get("type")
            if type == 'all':
                order = Order.objects.filter(customer_id=uid).values()
            else:
                order = Order.objects.filter(customer_id=uid,order_status=type).values()
            for item in order:
                order_id = item['order_id']
                create_order_time = str(item['create_order_time'])
                receive_order_time = str(item['receive_order_time'])
                finish_order_time = str(item['finish_order_time'])
                order_status = item['order_status']
                totalprice = 0
                count = 0
                description = ''
                orderdetail=OrderDetail.objects.filter(order_id=order_id).values()
                for oitem in orderdetail:
                    goods_id = oitem['goods_id']
                    goods=Goods.objects.filter(goods_id=goods_id).values()[0]
                    price = goods['price']
                    totalprice += oitem['quantity']*price
                    count += 1
                    if count>3:
                        continue
                    else:
                        description+=goods["goods_name"]
                        description += ' '
                if count>3:
                    description += ('等'+str(count)+"件商品")

                ocontent = {"order_id": order_id,"create_order_time":create_order_time,"receive_order_time":receive_order_time,
                    "finish_order_time":finish_order_time,"order_status":order_status,"total_price":totalprice,"description":description}
                data.append(ocontent)
            response = json.dumps(data)
            return HttpResponse(response)

    return HttpResponse(json.dumps({'message': '登录过期或用户名不存在'}))

@csrf_exempt
def OrderCancel(request):
    token = request.POST.get("token")
    oid = request.POST.get('order_id')
    user = User.objects.filter(token=token)
    if user:
        user = user.values()[0]
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            order=Order.objects.filter(order_id=oid).update(order_status=0)
            return HttpResponse(json.dumps({'success': True}))
            
    return HttpResponse(json.dumps({'message': '登录过期或用户名不存在'}))

@csrf_exempt
def OrderPayState(request):
    token = request.POST.get("token")
    oid = request.POST.get('order_id')
    secret = request.POST.get('secret')
    remark = request.POST.get('remark')
    user = User.objects.filter(token=token)
    if user:
        user = user.values()[0]
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            order=Order.objects.filter(order_id=oid).update(order_status=2,remarks=remark)
            return HttpResponse(json.dumps({'success': True}))
            
    return HttpResponse(json.dumps({'message': '登录过期或用户名不存在'}))


