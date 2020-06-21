import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/index.dart';
import 'package:xzn/models/user.dart';
import 'package:xzn/states/profile_change_notifier.dart';
import 'dart:math';

Widget CustomAvatar(
  BuildContext context, {
  double width = 80,
  double height,
  BoxFit fit,
  BorderRadius borderRadius,
}) {
  User user = Provider.of<UserModel>(context, listen: false).user;
  if (user != null) print(user.toJson());
  Random random = new Random();
  var placeholder = Image.asset(
      "assets/image/avatar_default_" +
          (random.nextInt(8) + 1).toString() +
          ".webp", //头像占位图，加载过程中显示
      width: width,
      height: height);
  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(100),
    child: Provider.of<UserModel>(context, listen: false).isLogin
        ? CachedNetworkImage(
            imageUrl: Config.baseUrl() + "avatar/load/" + user.head_image_id,
            width: width,
            height: height,
            fit: fit,
            placeholder: (context, url) => placeholder,
            errorWidget: (context, url, error) => placeholder,
          )
        : placeholder,
  );
}

Widget PictureSelf(String url,
    {Product product,
    double width,
    BoxFit boxFit,
    Widget placeholder,
    double height}) {
  placeholder = placeholder ??
      Image.asset(
        "assets/image/default_picture.webp", //头像占位图，加载过程中显示
        fit: BoxFit.cover,
      );
  String imageUrl = Config.baseUrl() +
      "picture/" +
      (product == null ? "" : product.product_id.toString() + "/") +
      url;
  return height == null
      ? CachedNetworkImage(
          imageUrl: imageUrl,
          fit: boxFit ?? BoxFit.fitWidth,
          width: width ?? double.infinity,
          placeholder: (context, url) => placeholder,
          errorWidget: (context, url, error) => placeholder,
        )
      : CachedNetworkImage(
          imageUrl: imageUrl,
          fit: boxFit ?? BoxFit.fitWidth,
          width: width ?? double.infinity,
          height: height ?? double.infinity,
          placeholder: (context, url) => placeholder,
          errorWidget: (context, url, error) => placeholder,
        );
}
