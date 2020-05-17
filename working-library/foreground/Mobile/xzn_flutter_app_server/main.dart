import 'dart:io';

import 'data.dart';

main(List<String> args) async {
  final String address = args.length != 0?args[0]:"192.168.42.224";
  final int port = args.length == 2?int.parse(args[1]):6080;
  // var requestServer = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
  var requestServer = await HttpServer.bind(address, port);

  await for (HttpRequest request in requestServer) {
    handleMessage(request);
  }
}

void handleMessage(HttpRequest request) {
  try {
    if (request.uri.toString() != "/favicon.ico") {
      switch(request.method) {
        case 'GET': {
          handleGet(request);
        }
        break;
        case 'POST': {
          handlePost(request);
        }
        break;
        default: {
          handleWrongMethod(request);
        }
      }
    }
  } catch (e) {
  }
}

void handlePost(HttpRequest request) {
  String suffix = ".json";
  responseJSON(request, suffix);
}

void handleGet(HttpRequest request) {
  String suffix = ".get.json";
  responseJSON(request, suffix);
}

void handleWrongMethod(HttpRequest request) {
  request.response..write('{\n\t"success": false,\n\t"message": "The Wrong Method!!"\n}')..close();
}

void handleWrongUrl(HttpRequest request) {
  request.response..write('{\n\t"success": false,\n\t"message": "The Wrong Url!!"\n}')..close();
}

void responseJSON(HttpRequest request, String suffix)  async{
  String file_url = request.uri.toString().substring(1)+suffix;
  File file = new File(file_url);
  String content;
  try {
    content = await file.readAsString();
    content = fillJSON(content);
    request.response
    ..statusCode = HttpStatus.ok
    ..write(content)
    ..close();
  }
  catch (FileSystemException) {
    String back_suffix = suffix==".json"?".get.json":".json";
    String file_url = request.uri.toString().substring(1)+back_suffix;
    File file = new File(file_url);
    if(await file.exists()) {
      handleWrongMethod(request);
    } else {
      back_suffix = ".error.json";
      file_url = request.uri.toString().substring(1);
      if (file_url.startsWith("api/avatar/")) {
        file_url = file_url.substring(11);
        String pictures = "assets/avatar/"+file_url+".webp";
        responseImage(request, pictures);
      } else if (file_url.startsWith("api/picture/")) {
        file_url = file_url.replaceAll("api/picture/", "assets/image/");
        String pictures = file_url+".webp";
        responseImage(request, pictures);
      } else {
        handleWrongUrl(request);
      }
    }
  }
}

void responseImage(HttpRequest request, String pictures) {
  request.response
  ..headers.contentType = new ContentType("image", "webp", charset: "utf-8")
  ..statusCode = HttpStatus.ok
  ..add(new File(pictures).readAsBytesSync())
  ..close();
}