from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from filetype import filetype
import time
import os
from Fresh_market_online.model import User
from LoginAPI.token_module import get_token, out_token
import json


@csrf_exempt
def AvatarUpload(request):
    file = request.FILES.get('file', None)
    token = request.POST.get("token")
    user = User.objects.filter(token=token)
    if user:
        user = user.values()[0]
        telephone = user['phone']
        if out_token(telephone, token):
            if not file:
                data = {"message": 'no file'}
                response = json.dumps(data)
                return HttpResponse(response)
            if not pIsAllowedFileSize(file.size):
                data = {"message": 'file too big'}
                response = json.dumps(data)
                return HttpResponse(response)

            '''ext = pGetFileExtension(file)
            if not pIsAllowedImageType(ext):
                data = {"message": 'extenal name error'}
                response = json.dumps(data)
                return HttpResponse(response)
            '''
            headid=str(hash(telephone + str(time.time())))
            print('./static/avatar' + '/' + headid + '.png')
            with open('./static/avatar' + '/' + headid + '.png', "wb+") as f:
                for chunk in file.chunks():
                    f.write(chunk)
            data = {"success": True}
            response = json.dumps(data)
            user = User.objects.filter(phone=telephone)
            oldid = str(user.values()[0]['head_image_id'])
            os.remove('./static/avatar' + '/' + oldid + '.png')
            user.update(head_image_id=headid)
            print(response)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)

@csrf_exempt
def AvatarLoad(request):

    head_image_id=request.path.rsplit('/', 1)[1]
    print(head_image_id);
    path = r'./static/avatar' + '/' + head_image_id + '.png'
    avatar = open(path, "rb")
    return HttpResponse(avatar.read(), content_type='image/png')

@csrf_exempt
def pGetFileExtension(file):
    rawData = bytearray()
    for c in file.chunks():
        rawData += c
    try:
        ext = filetype.guess_extension(rawData)
        return ext
    except Exception as e:
        return e
@csrf_exempt
def pIsAllowedImageType(ext):
    if ext in['png','jpeg','jpg']:
        return True
    return False
@csrf_exempt
def pIsAllowedFileSize(size):
    limit=2000000
    if size<limit:
        return True
    return False


