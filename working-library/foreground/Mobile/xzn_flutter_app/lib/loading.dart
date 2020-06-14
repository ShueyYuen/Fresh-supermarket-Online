import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:async';

import 'package:provider/provider.dart';

import 'states/profile_change_notifier.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  List<String> swiper = <String>[
    'assets/image/load/1.webp',
    'assets/image/load/2.webp',
    'assets/image/load/3.webp',
    'assets/image/load/4.webp',
    'assets/image/load/5.webp'
  ];

  @override
  void initState() {
    Provider.of<UserModel>(context, listen: false).first = false;
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed("app");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Swiper(
        itemCount: swiper.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 0),
            child: Image.asset(
              swiper[index],
              fit: BoxFit.cover,
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        autoplay: true,
      ),
    );
  }
}