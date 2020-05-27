from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from AddressAPI.models import Address
from UserInfoAPI.models import User
import json
from django_redis import get_redis_connection
from LoginAPI.token_module import get_token,out_token
@csrf_exempt
def AddressGet(request):
    token = request.POST.get("token")
    user = User.objects.filter(token=token).values()[0]
    data = []
    if user:
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
                detail = {'province': province, 'city': city, 'district': district, 'street': street, 'house_no': house_no}
                mdata['detail'] = detail
                mdata['longitude'] = longitude
                mdata['latitude'] = latitude
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
    user = User.objects.filter(token=token).values()[0]
    if user:
        telephone = user['phone']
        uid = user['user_id']
        if out_token(telephone, token):
            address_id = request.POST.get("address_id")

            person = eval(request.POST.get("person"))
            consignee = person["consignee"]
            sex = person["sex"]

            phone = request.POST.get("phone")

            detail = eval(request.POST.get("detail"))
            province = detail['province']
            city = detail['city']
            district = detail['district']
            street = detail['street']
            house_no = detail['house_no']

            longitude = request.POST.get("longitude")
            latitude = request.POST.get("latitude")
            tag = request.POST.get("tag")

            if address_id != '':
                Address.objects.filter(address_id=address_id).update(address_id=address_id, consignee=consignee,
                                                                     consignee_sex=sex, consignee_phone=phone,
                                                                     province=province, city=city, district=district,
                                                                     street=street, house_no=house_no,
                                                                     longitude=longitude, latitude=latitude, tag=tag)
            else:
                Address.objects.create(consignee=consignee,
                                        consignee_sex=sex, consignee_phone=phone,
                                        province=province, city=city, district=district,
                                        customer_id=uid,street=street, house_no=house_no,
                                        longitude=str(longitude), latitude=str(latitude), tag=tag)

            data={'success':True}
            response = json.dumps(data)
            print(response)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)