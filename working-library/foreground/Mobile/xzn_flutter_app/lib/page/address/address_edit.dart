import 'package:flutter/material.dart';
import 'package:xzn/index.dart';
import 'package:xzn/page/address/address_manage.dart';
import 'package:xzn/page/address/address_located.dart';
import 'package:xzn/states/profile_change_notifier.dart';

class AddressEdit extends StatefulWidget {
  AddressEdit({Key key, this.address: null, this.edit: true}) : super(key: key);
  bool edit;
  Address address;
  @override
  _AddressEditState createState() => _AddressEditState();
}

class _AddressEditState extends State<AddressEdit> {
  TextEditingController _consigneeController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  TextEditingController _noController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  int sex_index = 2;

  final Map<String, String> sex = {"M":"先生", "F":"女士", "NULL":"未知"};
  final List<String> tags = ["家", "学校", "公司"];

  @override
  void initState() {
    if (widget.edit) {
      _consigneeController.text = widget.address.person["consignee"];
      _telController.text = widget.address.phone;
      _addressController.text = widget.address.detail["city"] +
        widget.address.detail["district"] +
        "区" +
        widget.address.detail["street"] +
        "路";
      if (_addressController.text.length > 15)
        _addressController.text = _addressController.text
          .replaceRange(15, _addressController.text.length, '....');
      _noController.text = widget.address.detail["no"].toString();
    } else {
      widget.address = Address.fromJson(
        {
          "address_id": "",
          "person": {
            "consignee": "",
            "sex": ""
          },
          "phone": "",
          "detail": {
            "province": "",
            "city": "",
            "district": "",
            "street": "",
            "no": 0
          },
          "tag": ""
        }
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.edit ? "修改地址" : "新增收货地址"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: IconButton(
                icon: Icon(Icons.delete,color: Colors.white,),
                onPressed: () {
                  Provider.of<AddressModel>(context).delete(widget.address.address_id);
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 80,
                          padding: EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "联系人",
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextField(
                              controller: _consigneeController,
                            ),
                            Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 10,
                              children: sex.keys.map((_key) {
                                bool _selected = _key == widget.address.person["sex"];
                                  return RawChip(
//                                    label: Text(sex[widget.address.person["sex"]]),
                                    label: Text(sex[_key]),
                                    selected: _selected,
                                    labelStyle: TextStyle(
                                      color: _selected?Colors.white:Colors.grey[700]
                                    ),
                                    onSelected: (v){
                                      setState(() {
                                        widget.address.person["sex"] = _key;
                                      });
                                    },
                                    selectedColor: Theme.of(context).primaryColor,
                                  );
                                }).toList(),
                            )
                          ],
                        )),
                  ],
                )),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 30,
                          alignment: Alignment.topLeft,
                          child: Text(
                            "电话",
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          height: 30,
                          child: TextField(
                            controller: _telController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        )),
                  ],
                )),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 30,
                          alignment: Alignment.topLeft,
                          child: Text(
                            "地址",
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          height: 30,
                          child: TextField(
                            controller: _addressController,
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        )),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 30, maxWidth: 30),
                      child: IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 25,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AddressLocated();
                            }));
                          }),
                    ),
                  ],
                )),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 30,
                          alignment: Alignment.topLeft,
                          child: Text(
                            "门牌号",
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          height: 30,
                          child: TextField(
                            controller: _noController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        )),
                  ],
                )),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 30,
                          alignment: Alignment.topLeft,
                          child: Text(
                            "标签",
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: Wrap(
                          spacing: 10,
                          children: tags.map((_tag) {
                            bool _selected = _tag == widget.address.tag;
                            return RawChip(
//                                    label: Text(sex[widget.address.person["sex"]]),
                              label: Text(_tag.length<2?"   "+_tag+"   ":_tag),
                              labelStyle: TextStyle(
                                color: _selected?Colors.white:Colors.grey[700]
                              ),
                              selected: _selected,
                              onSelected: (v){
                                setState(() {
                                  widget.address.tag = _tag;
                                });
                              },
                              selectedColor: Theme.of(context).primaryColor,
                            );
                          }).toList(),
                        )),
                  ],
                )),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: FlatButton(
                color: Theme.of(context).primaryColor,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "保存",
                  style: TextStyle(fontSize: 18),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ));
  }
}
