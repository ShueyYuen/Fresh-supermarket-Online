import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/index.dart';
import 'package:xzn/models/address.dart';
import 'package:xzn/models/selfNearItem.dart';
import 'package:xzn/page/address/address_located.dart';
import 'package:xzn/services/address_service.dart';
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
  SelfNearItem selfNearItem;
  Address address;

  final Map<String, String> sex = {"M": "先生", "F": "女士", "NULL": "未知"};
  final List<String> tags = ["家", "学校", "公司"];

  @override
  void initState() {
    if (widget.edit) {
      selfNearItem = SelfNearItem();
      print(widget.address.toJson());
      var json = widget.address.toJson();
      var detail = widget.address.detail.toJson();
      json["detail"] = detail;
      address = Address.fromJson(json);
      _consigneeController.text = address.person["consignee"];
      _telController.text = address.phone;
      _addressController.text = address.detail.city +
          widget.address.detail.district +
          widget.address.detail.street;
      selfNearItem.city = address.detail.city;
      selfNearItem.district = address.detail.district;
      selfNearItem.township = address.detail.street;
      if (_addressController.text.length > 15)
        _addressController.text = _addressController.text
            .replaceRange(15, _addressController.text.length, '....');
      _noController.text = widget.address.detail.no ?? "";
    } else {
      address = Address.fromJson({
        "address_id": 0,
        "person": {"consignee": "", "sex": ""},
        "phone": "",
        "detail": {
          "province": "",
          "city": "",
          "district": "",
          "street": "",
          "no": "",
          "longitude": 0,
          "latitude": 0
        },
        "tag": ""
      });
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
            widget.edit
                ? IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      bool up = await deleteAddress(context, address);
                      Navigator.of(context).pop(up??false);
                    },
                  )
                : Text(""),
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
                                bool _selected = _key == address.person["sex"];
                                return RawChip(
                                  checkmarkColor: Colors.white,
//                                    label: Text(sex[widget.address.person["sex"]]),
                                  label: Text(sex[_key]),
                                  selected: _selected,
                                  labelStyle: TextStyle(
                                      color: _selected
                                          ? Colors.white
                                          : Colors.grey[700]),
                                  onSelected: (v) {
                                    setState(() {
                                      address.person["sex"] = _key;
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
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 32,
                          alignment: Alignment.topLeft,
                          child: Text(
                            "地址",
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    Expanded(
                        flex: 7,
                        child: Container(
                          height: 50,
                          child: TextField(
                            controller: _addressController,
                            expands: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: 30, maxWidth: 30),
                        child: IconButton(
                            padding: EdgeInsets.all(0),
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 25,
                              color: Colors.grey,
                            ),
                            onPressed: () async {
                              var result = await Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AddressLocated();
                              })) as SelfNearItem;
                              setState(() {
                                selfNearItem = result ?? selfNearItem;
                              });
                              _addressController.text = selfNearItem.city +
                                  selfNearItem.district +
                                  selfNearItem.township +
                                  selfNearItem.build;
                            }),
                      ),
                    )
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
                            bool _selected = _tag == address.tag;
                            return RawChip(
                              checkmarkColor: Colors.white,
//                                    label: Text(sex[widget.address.person["sex"]]),
                              label: Text(_tag.length < 2
                                  ? "   " + _tag + "   "
                                  : _tag),
                              labelStyle: TextStyle(
                                  color: _selected
                                      ? Colors.white
                                      : Colors.grey[700]),
                              selected: _selected,
                              onSelected: (v) {
                                setState(() {
                                  address.tag = _tag;
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
                onPressed: () async {
                  print("COFLCONER");
                  address.person["consignee"] = _consigneeController.text;
                  address.phone = _telController.text;
                  Amapgeo addressMap =
                      await getAddressDetail(_addressController);
                  print(addressMap.toJson());
                  address.detail = addressMap;
                  address.detail.no = _noController.text;
                  int a = await updateAddress(context, address);
                  print(a);
                  if (widget.edit) Navigator.of(context).pop(true);
                },
              ),
            )
          ],
        ));
  }
}
