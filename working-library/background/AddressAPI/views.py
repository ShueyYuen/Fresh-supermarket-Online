from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from Fresh_market_online.model import User, Address
import json
from django_redis import get_redis_connection
from LoginAPI.token_module import get_token,out_token
@csrf_exempt
def AddressGet(request):
    token = request.POST.get("token")
    user = User.objects.filter(token=token)
    data = []
    if user:
        user=user.values()[0]
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            for address in Address.objects.filter(customer_id=uid).values():
                address_id = address['address_id']
                consignee =address['consignee']
                sex = address['consignee_sex']
                phone = address['consignee_phone']
                province = address['province']
                city = address['city']
                district = address['district']
                township = address['township']
                street = address['street']
                house_no = address['house_no']
                longitude = address['longitude']
                latitude = address['latitude']
                tag = address['tag']

                mdata ={}
                mdata['address_id'] = address_id
                person = {'consignee': consignee, 'sex': sex}
                mdata['person'] = person
                mdata['phone'] = phone
                detail = {'province': province, 'city': city, 'district': district, 'township':township,'street': street,
                          'no': house_no,'longitude':longitude,"latitude":latitude}
                mdata['detail'] = detail
                mdata['tag'] = tag
                data.append(mdata)

            response = json.dumps(data)
            print(response)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)

@csrf_exempt
def AddressUpdate(request):
    token = request.POST.get("token")
    user = User.objects.filter(token=token)
    if user:
        user=user.values()[0]
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            address_id = request.POST.get("address_id")

            print(address_id,request.POST.get("person"))
            person = eval(request.POST.get("person"))
            
            consignee = person["consignee"]
            sex = person["sex"]

            phone = request.POST.get("phone")

            detail = eval(request.POST.get("detail"))
            province = detail['province']
            city = detail['city']
            district = detail['district']
            township = detail['township']
            street = detail['street']
            house_no = detail['no']
            longitude =detail['longitude']
            latitude = detail['latitude']
            tag = request.POST.get("tag")

            if int(address_id) != 0:
                Address.objects.filter(address_id=address_id).update(consignee=consignee,
                                                                     consignee_sex=sex, consignee_phone=phone,
                                                                     province=province, city=city, district=district,
                                                                     township=township,street=street, house_no=house_no,
                                                                     longitude=longitude, latitude=latitude, tag=tag)
            else:
                Address.objects.create(consignee=consignee,
                                        consignee_sex=sex, consignee_phone=phone,
                                        province=province, city=city, district=district,
                                        customer_id=uid,township=township,street=street, house_no=house_no,
                                        longitude=longitude, latitude=latitude, tag=tag)
                addr=Address.objects.filter(consignee=consignee,
                                        consignee_sex=sex, consignee_phone=phone,
                                        province=province, city=city, district=district,
                                        customer_id=uid,township=township,street=street, house_no=house_no,
                                        longitude=longitude, latitude=latitude, tag=tag).values()[0]
                address_id=addr['address_id']

            data={'address_id':str(address_id)}
            response = json.dumps(data)
            print(response)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)

@csrf_exempt
def AddressDelete(request):
    token = request.POST.get("token")
    address_id = request.POST.get("address_id")
    user = User.objects.filter(token=token)
    if user:
        user=user.values()[0]
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            Address.objects.filter(address_id=address_id).delete()
            data = {"success": True}
            response = json.dumps(data)
            print(response)
            return HttpResponse(response)
        
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)
