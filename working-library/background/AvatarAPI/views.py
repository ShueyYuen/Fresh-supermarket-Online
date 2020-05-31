from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from filetype import filetype

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

            print('./static/avatar' + '/' + telephone + '.png')
            with open('./static/avatar' + '/' + telephone + '.png', "wb+") as f:
                for chunk in file.chunks():
                    f.write(chunk)
            data = {"success": True}
            response = json.dumps(data)
            print(response)
            return HttpResponse(response)
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)

@csrf_exempt
def AvatarLoad(request):
    token = request.POST.get("token")
    user = User.objects.filter(token=token)
    if user:
        user = user.values()[0]
        telephone = user['phone']
        if out_token(telephone, token):
            path = r'./static/avatar' + '/' + telephone + '.png'
            avatar = open(path, "rb")
            return HttpResponse(avatar.read(), content_type='image/png')
    data = {"message": "Failed"}
    response = json.dumps(data)
    print(response)
    return HttpResponse(response)

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


