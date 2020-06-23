from django.utils import timezone as datetime
import json

from django.shortcuts import render
# Create your views here.
#coding:utf-8
from elasticsearch_dsl import  Search, connections
# encoding:utf-8
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from elasticsearch import Elasticsearch
from Fresh_market_online.model import Goods, User, History
from GoodsAPI.views import getpicture
from LoginAPI.token_module import out_token

#hosts = '172.16.0.8'
hosts = 'localhost'
@csrf_exempt
def ESdata(hosts):
    # 获取Mysql登录数据
    goods_data = Goods.objects.filter().values()
    es = Elasticsearch(hosts=hosts, port=9200)
    #清除
    delete_by_all = {"query": {"match_all": {}}}
    result = es.delete_by_query(index="goods",body=delete_by_all)
    #print(result)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    for d in goods_data:
        data = {'goods_name':d['goods_name'],'goods_id':d['goods_id'] }
        #print(d['goods_name'])
        es.index(index='goods', doc_type="doc", body=data)
@csrf_exempt
def ESmatch(goods_name):
    # match:匹配name包含python关键字的数据
    body = {
        "query": {
            "match": {
                "goods_name": goods_name
            }
        }
    }
    # 查询name包含python关键字的数据
    es = Elasticsearch(hosts=hosts, port=9200)
    return es.search(index="goods", body=body)


@csrf_exempt
def GoodsSearch(request):
    token = request.POST.get("token")
    print(token)
    type = request.POST.get("type")
    print(type)
    lprice = 0.00
    hprice = 99999999.00
    if request.POST.get("highprice") != "":
        hprice = request.POST.get("highprice")
    if request.POST.get("lowprice") != "":
        lprice = request.POST.get("lowprice")
    if token == None or token == '':
        data = []
        key = request.POST.get("key")
        print('key:', key)
        if key == '' or key == None:
            goodslist = Goods.objects.filter(goods_type=type).values()
            for goods in goodslist:
                goods_id = goods['goods_id']
                product_name = goods['goods_name']
                goods_type = goods['goods_type']
                price = {"num": goods['price'], "unit": str(goods['unit'])}
                shuffle, detail = getpicture(str(goods_id))
                print(shuffle, detail)
                picture_list = {"shuffle": shuffle, "detail": detail}
                details = {"origin": goods['origin'], "specification": goods['specification'],
                           "packaging": goods['packaging'], "stockway": goods['stockway'], "weight": goods['weight']}
                stock = goods['stock']
                discount = goods['discount']
                description = {"subtitle": goods['subtitle'], "distribution": goods['distribution'],
                               "promotion": goods['promotion']}
                tags = {"type": goods['tags_type'], "content": goods['tags_content']}

                result = {"product_name": str(product_name), "product_id": str(goods_id), 'goods_type': goods_type,
                          "price": price,
                          "picture_list": picture_list, "details": details, "stock": stock, "discount": discount,
                          "description": description, "tags": tags}

                data.append(result)
            response = json.dumps(data)
            print(data)
            return HttpResponse(response)
        else:
            result = (ESmatch(key))
            for item in result['hits']['hits']:
                # print(item)
                # print(item['_source']['goods_id'])
                goods_id = item['_source']['goods_id']
                # print(lprice)
                # print(hprice)

                if type == '' or type == None:
                    if Goods.objects.filter(goods_id=goods_id, price__range=(lprice, hprice)):
                        goods = Goods.objects.filter(goods_id=goods_id, price__range=(lprice, hprice)).values()[0]
                    else:
                        continue
                else:
                    if Goods.objects.filter(goods_id=goods_id, goods_type=type, price__range=(lprice, hprice)):
                        goods = Goods.objects.filter(goods_id=goods_id, goods_type=type,
                                                     price__range=(lprice, hprice)).values()[0]
                    else:
                        continue

                product_name = goods['goods_name']
                goods_type = goods['goods_type']
                price = {"num": goods['price'], "unit": str(goods['unit'])}
                shuffle, detail = getpicture(str(goods_id))
                picture_list = {"shuffle": shuffle, "detail": detail}
                details = {"origin": goods['origin'], "specification": goods['specification'],
                           "packaging": goods['packaging'], "stockway": goods['stockway'], "weight": goods['weight']}
                stock = goods['stock']
                discount = goods['discount']
                description = {"subtitle": goods['subtitle'], "distribution": goods['distribution'],
                               "promotion": goods['promotion']}
                tags = {"type": goods['tags_type'], "content": goods['tags_content']}

                result = {"product_name": str(product_name), "product_id": str(goods_id), 'goods_type': goods_type,
                          "price": price,
                          "picture_list": picture_list, "details": details, "stock": stock, "discount": discount,
                          "description": description, "tags": tags}

                data.append(result)
            response = json.dumps(data)
            print(data)
            return HttpResponse(response)
    else:
        user = User.objects.filter(token=token)
        ESdata(hosts)
        if user:
            user = user.values()[0]
            telephone = user['phone']
            user_id = user['user_id']
            if out_token(telephone, token):
                data = []
                key = request.POST.get("key")
                print('key:',key)
                time=datetime.now()
                History.objects.create(user_id=user_id, key=key, time=time)
                if key=='' or key==None:
                    goodslist=Goods.objects.filter(goods_type=type).values()
                    for goods in goodslist:
                        goods_id = goods['goods_id']
                        product_name = goods['goods_name']
                        goods_type = goods['goods_type']
                        price = {"num": goods['price'], "unit": str(goods['unit'])}
                        shuffle, detail = getpicture(str(goods_id))
                        print(shuffle,detail)
                        picture_list = {"shuffle": shuffle, "detail": detail}
                        details = {"origin": goods['origin'], "specification": goods['specification'],
                                   "packaging": goods['packaging'], "stockway": goods['stockway'], "weight": goods['weight']}
                        stock = goods['stock']
                        discount = goods['discount']
                        description = {"subtitle": goods['subtitle'], "distribution": goods['distribution'],
                                       "promotion": goods['promotion']}
                        tags = {"type": goods['tags_type'], "content": goods['tags_content']}

                        result = {"product_name": str(product_name), "product_id": str(goods_id), 'goods_type':goods_type,"price": price,
                                "picture_list": picture_list, "details": details, "stock": stock, "discount": discount,
                                "description": description, "tags": tags}

                        data.append(result)
                    response = json.dumps(data)
                    print(data)
                    return HttpResponse(response)
                else:
                    result=(ESmatch(key))
                    for item in result['hits']['hits']:
                        #print(item)
                        #print(item['_source']['goods_id'])
                        goods_id = item['_source']['goods_id']
                        #print(lprice)
                        #print(hprice)

                        if type=='' or type==None:
                            if Goods.objects.filter(goods_id=goods_id, price__range=(lprice, hprice)):
                                goods = Goods.objects.filter(goods_id=goods_id,price__range=(lprice,hprice)).values()[0]
                            else:
                                continue
                        else:
                            if Goods.objects.filter(goods_id=goods_id, goods_type=type,price__range=(lprice,hprice)):
                                goods = Goods.objects.filter(goods_id=goods_id, goods_type=type,
                                                            price__range=(lprice, hprice)).values()[0]
                            else:
                                continue

                        product_name = goods['goods_name']
                        goods_type = goods['goods_type']
                        price = {"num": goods['price'], "unit": str(goods['unit'])}
                        shuffle, detail = getpicture(str(goods_id))
                        picture_list = {"shuffle": shuffle, "detail": detail}
                        details = {"origin": goods['origin'], "specification": goods['specification'],
                                   "packaging": goods['packaging'], "stockway": goods['stockway'], "weight": goods['weight']}
                        stock = goods['stock']
                        discount = goods['discount']
                        description = {"subtitle": goods['subtitle'], "distribution": goods['distribution'],
                                       "promotion": goods['promotion']}
                        tags = {"type": goods['tags_type'], "content": goods['tags_content']}

                        result = {"product_name": str(product_name), "product_id": str(goods_id), 'goods_type':goods_type,"price": price,
                                "picture_list": picture_list, "details": details, "stock": stock, "discount": discount,
                                "description": description, "tags": tags}

                        data.append(result)
                    response = json.dumps(data)
                    print(data)
                    return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)

@csrf_exempt
def GetHistory(request):
    token = request.POST.get("token")
    user = User.objects.filter(token=token)
    ESdata(hosts)
    if user:
        user = user.values()[0]
        telephone = user['phone']
        user_id = user['user_id']
        if out_token(telephone, token):
            data = []
            history = History.objects.filter(user_id=user_id).values()
            for hitem in history:
                key = hitem['key']
                time = hitem['time']
                result = {'key':key, 'time':str(time)}
                data.append(result)
            response = json.dumps(data)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)

