import 'package:flutter/material.dart';

class Classification extends StatefulWidget {
  @override
  _ClassificationState createState() => new _ClassificationState();
}

class _ClassificationState extends State<Classification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          scrollDirection: Axis.horizontal,
          itemExtent: 50.0, //强制高度为50.0
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text("$index"));
          }
        ),
      ),
    );
  }
}