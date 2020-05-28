from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from Fresh_market_online.model import User,Address,Order,OrderDetail,Goods
from LoginAPI.token_module import get_token,out_token
import json

@csrf_exempt
def Logoff(request):
    token=request.POST.get('token')
    del_user=User.objects.filter(token=token)
    if del_user:
        data=[]
        user=del_user.values()[0]
        uid=user['user_id']
        phone=user['phone']
        del_order=Order.objects.filter(customer_id=uid)
        order=del_order.values()
        for oitem in order:
            oid=oitem['order_id']
            address_id=oitem['address_id']
            del_address=Address.objects.filter(address_id=address_id)
            address=del_address.values()
            del_order_detail=OrderDetail.objects.filter(order_id=oid)
            order_detail=del_order_detail.values()
            for ditem in order_detail:
                goods_id=ditem['goods_id']
                goods=Goods.objects.filter(goods_id=goods_id)
                
                tmp={"user_id":uid,"phone":phone,"address_id":address_id,"customer_id":uid,"province":address['province'],
                    "consignee":address['consignee'],"consignee_phone":address['consignee_phone'],"consignee_sex":address['consignee_sex'],
                     "house_no":address['house_no'],"latitude":address['latitude'],"longitude":address['longitude'],
                    "tag":address['tag'],"city":address['city'],"district":address['district'],"street":address[street],
                    "order_id":oid,"deliveryman_id":oitem['deliveryman_id'],"warehouse_id":oitem['warehouse_id'],"finish_order_time":oitem['finish_order_time'],
                    "remarks":oitem['remarks'],"goods_id":goods_id,"quantity":ditem['quantity'],"order_status":oitem['order_status']}
                data.append(tmp)
                goods.delete()
            del_order_detail.delete()
        del_user.delete()
        del_order.delete()
        
        response=json.dumps({"success":True})
        return HttpResponse(response)
    else:
        response=json.dumps({"message":'token过期或没有该用户'})
        return HttpResponse(response)
