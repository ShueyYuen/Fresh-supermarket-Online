import datetime

from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from Fresh_market_online.model import User, Goods, Order, OrderDetail, Deliveryman, Address, ShoppingCart
import json
from LoginAPI.token_module import get_token,out_token
from GoodsAPI.views import getpicture
@csrf_exempt
def OrderDetails(request):#deprecated
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
                    detail={'province':addr['province'],'city':addr['city'],'district':addr['district'],'street':addr['street'],'no':addr['house_no'],'longitude':addr['longitude'],'latitude':addr['latitude'],'tag':addr['tag']}

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
            print(data)
            return HttpResponse(json.dumps(data))
    return HttpResponse(json.dumps({'message':'登录过期或用户名不存在'}))


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
            order=Order.objects.filter(customer_id=uid)#.exclude(order_status=0)
            data=[]
            if order:
                for item in order.values():
                    oid = item['order_id']
                    user=User.objects.filter(user_id=item['customer_id']).values()[0]
                    addr=Address.objects.filter(customer_id=item['customer_id']).values()[0]

                    phone,sex,nickname=user['phone'],user['sex'],user['nickname']
                    customer={'phone':phone,'sex':sex,'nickname':nickname}
                    address={'address_id':addr['address_id'],'person':{'consignee':addr['consignee'],'sex':addr['consignee_sex']},'phone':addr['consignee_phone'],'detail':{'province':addr['province'],'city':addr['city'],'district':addr['district'],'street':addr['street'],'no':addr['house_no'],'longitude':addr['longitude'],'latitude':addr['latitude'],'tag':addr['tag']}}

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
                    deliveryman={'deliveryman_id':dman['deliveryman_id'],'name':duser['nickname'],'phone':duser['phone'],'sex':duser['sex'],'longitude':30.915406,'latitude':121.479650,'status':dman['taking_status']}
                    #print(deliveryman)
                    data.append({'order_id':oid,'customer':customer,'address':address,'product_list':product_list,'deliveryman':deliveryman,
                                'create_order_time':str(item['create_order_time']),'receive_order_time':str(item['receive_order_time']),'finish_order_time':str(item['finish_order_time']),
                                'order_status':item['order_status'],'payment_id':item['payment_id'],'total_price':total_price})
            #print(data)
            return HttpResponse(json.dumps(data))
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
    user = User.objects.filter(token=token)
    if user:
        user = user.values()[0]
        telephone = user['phone']
        uid = user['user_id']
        remark=request.POST.get("remark")
        if out_token(telephone, token):
            print(request.POST.get("orders"))
            goods_list =eval(request.POST.get("orders"))
            if len(goods_list)==0:
                return HttpResponse(json.dumps({'message': '订单已提交，请勿重复提交'}))
            print(goods_list)
            adderss_id = request.POST.get("address_id")
            create_order_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            order_status = 1
            warehouse_id = '01'
            Order.objects.create(customer_id=uid, deliveryman_id=uid, create_order_time=create_order_time,
                                         order_status=order_status, warehouse_id=warehouse_id,
                                         address_id=int(adderss_id),remarks=remark)
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
def xznpay(request):
    token = request.POST.get("token")
    oid=request.POST.get("order_id")
    user = User.objects.filter(token=token)
    if user:
        user = user.values()[0]
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            order=Order.objects.filter(order_id=oid).values()[0]
            #print(order)
            if order['order_status']!=1:
                return HttpResponse(json.dumps({'message': '订单状态不是待支付'}))
            orderdetail=OrderDetail.objects.filter(order_id=order['order_id']).values()
            total_price=0
            print("od length:",len(orderdetail))
            for ODitem in orderdetail:
                gid=ODitem['goods_id']
                goods = Goods.objects.filter(goods_id=gid).values()[0]
                discount = goods['discount']
                total_price += (goods['price']*ODitem['quantity']*discount)
            total_price += 10.0#配送费
            print("total_price:",total_price)
            if user['money']<total_price:
                return HttpResponse(json.dumps({'message': '余额不足'}))
            user=User.objects.filter(user_id=uid).update(money=user['money']-total_price)
            order=Order.objects.filter(order_id=oid).update(order_status=2,finish_order_time=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
            return HttpResponse(json.dumps({'success': True}))
            
    return HttpResponse(json.dumps({'message': '登录过期或用户名不存在'}))

@csrf_exempt
def OrderConfirm(request):
    token = request.POST.get("token")
    oid=request.POST.get("order_id")
    user = User.objects.filter(token=token)
    if user:
        user = user.values()[0]
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            Order.objects.filter(order_id=oid).update(order_status=4,receive_order_time=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
            return HttpResponse(json.dumps({'success': True}))
            
    return HttpResponse(json.dumps({'message': '登录过期或用户名不存在'}))
