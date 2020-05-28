#-*- coding: utf-8 -*-
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from Fresh_market_online.model import User, Address, Order, OrderDetail, Goods, Recycle
from LoginAPI.token_module import get_token,out_token
import json

@csrf_exempt
def Logoff(request):
    token=request.POST.get('token')
    del_user=User.objects.filter(token=token)
    if del_user:
        user=del_user.values()[0]
        user_id=user['user_id']
        phone=user['phone']
        del_order=Order.objects.filter(customer_id=user_id)
        order=del_order.values()
        for oitem in order:
            order_id=oitem['order_id']
            address_id=oitem['address_id']
            del_address=Address.objects.filter(address_id=address_id)
            address=del_address.values()[0]
            consignee = address['consignee']
            consignee_phone = address['consignee_phone']
            consignee_sex = address['consignee_sex']
            province = address['province']
            city = address['city']
            district = address['district']
            street = address['street']
            house_no = address['house_no']
            latitude = address['latitude']
            longitude = address['longitude']
            tag = address['tag']
            deliveryman_id = oitem['deliveryman_id']
            del_order_detail=OrderDetail.objects.filter(order_id=order_id)
            order_detail=del_order_detail.values()[0]
            goods_id=order_detail['goods_id']
            warehouse_id = oitem['warehouse_id']
            finish_order_time = oitem['finish_order_time']
            remarks = oitem['remarks']
            quantity = order_detail['quantity']
            order_status = oitem['order_status']

            Recycle.objects.create(user_id=user_id,phone=phone,address_id=address_id,province=province,consignee=consignee,
                                   consignee_phone=consignee_phone,consignee_sex=consignee_sex,house_no=house_no,
                                   latitude=latitude,longitude=longitude,tag=tag,city=city,district=district,street=street,
                                   order_id=order_id,deliveryman_id=deliveryman_id,warehouse_id=warehouse_id,
                                   finish_order_time=finish_order_time,remarks=remarks,goods_id=goods_id,quantity=quantity,
                                   order_status=order_status)
            del_order_detail.delete()
        del_user.delete()
        del_order.delete()
        
        response=json.dumps({"success":True})
        return HttpResponse(response)
    else:
        response=json.dumps({"message":'token过期或没有该用户'})
        return HttpResponse(response)
