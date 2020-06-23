import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:xzn/index.dart';
import 'package:xzn/models/user.dart';
import 'package:xzn/page/login/login_choose.dart';
import 'package:xzn/services/information_service.dart';
import 'package:xzn/services/picture.dart';
import 'package:xzn/states/profile_change_notifier.dart';
import 'package:xzn/widget/my/crop_image.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  String sex_choose;

  final Map<String, String> sex = {"M": "先生", "F": "女士", "NULL": "未知"};

  void cropImage(File originalImage) async {
    String result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => CropImageRoute(originalImage)));
//    if (result.isEmpty) {
//      print('上传失败');
//    } else {
//      // TODO: 头像上传后可以立刻更新头像
//      //result是图片上传后拿到的url
//      setState(() {
////        iconUrl = result;
////        print('上传成功：$iconUrl');
////        _upgradeRemoteInfo();//后续数据处理，这里是更新头像信息
//      });
//    }
  }

  Future getImage() async {
    await ImagePicker.pickImage(source: ImageSource.camera)
        .then((image) => cropImage(image));
  }

  Future chooseImage() async {
    await ImagePicker.pickImage(source: ImageSource.gallery)
        .then((image) => cropImage(image));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserModel>(context, listen: false).user;
    _nameController.text = user.nickname;
    sex_choose = sex_choose??user.sex;
    _telController.text = user.phone;
    if (Provider.of<UserModel>(context, listen: false).isLogin)
      return Scaffold(
        appBar: AppBar(
          title: Text("个人信息"),
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(11, 20, 11, 10),
            child: Row(
              children: <Widget>[
                Title(
                    color: Colors.black,
                    child: Text(
                      "头        像",
                      style: TextStyle(fontSize: 18),
                    )),
                Expanded(
                  child: Text(''), // 中间用Expanded控件
                ),
                GestureDetector(
                  child: CustomAvatar(context),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 25),
                          child: ListView(
//                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  color: Colors.lightGreen,
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  onPressed: () {
                                    getImage();
                                  },
                                  child: Text(
                                    "拍照上传",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  color: Colors.blue,
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  onPressed: () {
                                    chooseImage();
                                  },
                                  child: Text(
                                    "相册选择",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ))
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Divider(
            thickness: 3,
            color: Colors.grey[200],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30,
                        alignment: Alignment.topLeft,
                        child: Text(
                          "用  户  名",
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 30,
                        child: TextField(
                          controller: _nameController,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      )),
                  ],
                ),
          ),
          Divider(
            thickness: 3,
            color: Colors.grey[200],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    alignment: Alignment.topLeft,
                    child: Text(
                      "性        别",
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
                Expanded(
                  flex: 4,
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    spacing: 10,
                    children: sex.keys.map((_key) {
                      bool _selected = _key == sex_choose;
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
                            sex_choose = _key;
                          });
                        },
                        selectedColor: Theme.of(context).primaryColor,
                      );
                    }).toList(),
                  )),
              ],
            ),
          ),
          Divider(
            thickness: 3,
            color: Colors.grey[200],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    alignment: Alignment.topLeft,
                    child: Text(
                      "电话号码",
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 30,
                    child: TextField(
                      readOnly: true,
                      controller: _telController,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )),
              ],
            ),
          ),
          Divider(
            thickness: 3,
            color: Colors.grey[200],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: <Widget>[
                Container(
                    height: 30,
                    alignment: Alignment.topLeft,
                    child: Text(
                      "账户余额",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                Expanded(child: Text("")),
                Text("￥"+(user.money??0.0).toStringAsFixed(2)+" ", style: TextStyle(fontSize: 16),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Text(
                  "确认修改",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
              onPressed: () async {
                bool success = await updateInformation(context, nickname: _nameController.text, sex: sex_choose);
                if (success) getInformation(context);
              },
            ),
          )
        ]),
      );
    else return LoginChoose();
  }
}
