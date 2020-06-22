import 'package:flutter/material.dart';
class NumberControllerWidget extends StatefulWidget {
  final double height;
  final double width;
  final double iconWidth;
  final String numText;
  //点击加号回调 数量
  final ValueChanged addValueChanged;
  //点击减号回调 数量
  final ValueChanged removeValueChanged;
  //点击减号任意一个回调 数量
  final ValueChanged updateValueChanged;

  NumberControllerWidget({
    this.height = 30,
    this.width = 40,
    this.iconWidth = 40,
    this.numText = '0',
    this.addValueChanged,
    this.removeValueChanged,
    this.updateValueChanged,
  });
  @override
  _NumberControllerWidgetState createState() => _NumberControllerWidgetState();
}

class _NumberControllerWidgetState extends State<NumberControllerWidget> {
  var textController= new TextEditingController();

  @override
  void initState() {
    textController.text = widget.numText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1,color: Colors.black12)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //减号
              CoustomIconButton(icon: Icons.remove,isAdd: false),
              //输入框
              Container(
                width: widget.width,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 1,color: Colors.black12),
                    right: BorderSide(width: 1,color: Colors.black12)
                  )
                ),
                child: TextField(
                  enabled: false,
                  controller: textController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12
                  ),
                  enableInteractiveSelection: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 0,top: 2,bottom: 2,right: 0),
                    border: const OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
              //加号
              CoustomIconButton(icon: Icons.add,isAdd: true),
            ],
          ),
        )
      ],
    );
  }

  Widget CoustomIconButton({IconData icon,bool isAdd}){
    return Container(
      color: Colors.grey[300],
      width: widget.iconWidth,
      child:IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(icon,size: 12,color: Colors.lightBlueAccent,),
        onPressed: (){
          var num = int.parse(textController.text);
          if(!isAdd&&num ==0)return;
          if(isAdd){
            num ++;
            if(widget.addValueChanged !=null)widget.addValueChanged(num);
          }
          else{
            num --;
            if(widget.removeValueChanged !=null)widget.removeValueChanged(num);
          }
          textController.text = '$num';
          if(widget.updateValueChanged !=null)widget.updateValueChanged(num);
        },
      ),
    );
  }
}