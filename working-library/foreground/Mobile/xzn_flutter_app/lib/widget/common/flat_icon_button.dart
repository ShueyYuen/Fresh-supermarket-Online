import 'package:flutter/material.dart';

class FlatIconButton extends StatelessWidget {
  FlatIconButton(
      {Key key,
      this.size: 35,
      this.iconColor: Colors.white,
      this.backColor: null,
      this.icon: Icons.shopping_cart,
        this.onTap: null
      })
      : super(key: key);

  double size;
  Color iconColor;
  Color backColor;
  IconData icon;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: this.size,
        maxWidth: this.size,
      ),
      child: Container(
          decoration: BoxDecoration(
              color: backColor?? Theme.of(context).primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(this.size))),
          child: IconButton(
            padding: EdgeInsets.all(0),
            iconSize: this.size *2 /3,
            color: iconColor,
            icon: Icon(icon,color: iconColor,),
            onPressed: onTap
          )),
    );
  }
}
