import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatelessWidget {
  List<String> swiper = <String>[
    'assets/image/swiper/1.webp',
    'assets/image/swiper/2.webp',
    'assets/image/swiper/3.webp',
    'assets/image/swiper/4.webp',
    'assets/image/swiper/5.webp'
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width*500.0 / 1080.0;
    return Container(
      width: width,
      height: height,
      child: Swiper(
        itemCount: swiper.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 0),
            child: Image.asset(
              swiper[index],
              width: width,
              height: height,
              fit: BoxFit.fitWidth,
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        autoplay: true,
      ),
    );
  }
}