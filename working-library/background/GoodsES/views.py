import datetime
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
from LoginAPI.token_module import out_token

hosts = '127.0.0.1'
@csrf_exempt
def ESdata(hosts):
    # 获取Mysql登录数据
    goods_data = Goods.objects.filter().values()
    es = Elasticsearch(hosts=hosts, port=9200)
    #清除
    delete_by_all = {"query": {"match_all": {}}}
    result = es.delete_by_query(index="goods",body=delete_by_all)
    print(result)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    for d in goods_data:
        data = {'goods_name':d['goods_name'],'goods_id':d['goods_id'],'goods_type':d['goods_type'],'price':d['price']}
        print(d['goods_name'])
        res = es.index(index='goods', doc_type="doc", body=data)
        print(res)
        print("++++++++++++++++++++++++++++++++++++++++++")
    print(es.search(index="goods"))
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
    user = User.objects.filter(token=token)
    ESdata(hosts)
    if user:
        user = user.values()[0]
        telephone = user['phone']
        user_id = user['user_id']
        if out_token(telephone, token):
            data = []
            key = request.POST.get("key")

            time=datetime.datetime.now()
            History.objects.create(user_id=user_id, key=key, time=time)

            result=(ESmatch(key))
            for item in result['hits']['hits']:
                score = item['_score']
                item = item['_source']
                goods_name = item['goods_name']
                goods_id = item['goods_id']
                goods_type = item['goods_type']
                price = item['price']
                result={'goods_name':goods_name, 'goods_id':goods_id, 'score':score, 'goods_type':goods_type,'price':price}
                data.append(result)
            response = json.dumps(data)
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

