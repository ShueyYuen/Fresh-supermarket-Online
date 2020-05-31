import 'package:flutter/material.dart';

class IconTextUnder extends StatelessWidget {
  IconTextUnder({Key key, this.icon, this.text: "", this.badge: 0, this.onTap: null}):super(key:key);
  IconData icon;
  String text;
  var badge;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    if (badge == null) badge = 0;
    double fontsize = badge > 99?8.0:badge>9?12:15;
    return FlatButton(
      onPressed: onTap,
      child: Stack(
        alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 12),
            alignment: Alignment.topCenter,
            child: Icon(icon,size: 40,color: Colors.blue[400],),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            child: badge>0?Container(
              width: 16,
              height: 16,
              child: Center(
                child: Text(
                  badge.toString(),
                  style: TextStyle(
                    fontSize: fontsize,
                    color: Colors.white
                  )
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: new BorderRadius.all(
                  const Radius.circular(16.0),
                ),
              ),
            ):Text("")
          ),
        ],
      ),
    );
  }
}