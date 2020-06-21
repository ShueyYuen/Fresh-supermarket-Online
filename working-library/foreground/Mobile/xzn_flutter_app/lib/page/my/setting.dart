import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:xzn/page/login/login_choose.dart';
import 'package:xzn/page/my/account_safe.dart';
import 'package:xzn/page/my/customer_service.dart';
import 'package:xzn/page/my/privacy.dart';

import '../../models/user.dart';
import '../../states/profile_change_notifier.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String _cacheSizeStr;

  _renderSize(double value) {
    if (null == value) {
      return 0;
    }
    List<String> unitArr = List()..add('B')..add('K')..add('M')..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  Future<Null> delDir(FileSystemEntity file) async {
    try {
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        for (final FileSystemEntity child in children) {
          await delDir(child);
        }
      }
      await file.delete();
    } catch (e) {
      print(e);
    }
  }

  Future<Null> loadCache() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      print('临时目录大小: ' + value.toString());
      setState(() {
        _cacheSizeStr = _renderSize(value);
      });
    } catch (err) {
      print(err);
    }
  }

  /// 递归方式 计算文件的大小
  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    try {
      if (file is File) {
        int length = await file.length();
        return double.parse(length.toString());
      }
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        double total = 0;
        if (children != null)
          for (final FileSystemEntity child in children)
            total += await _getTotalSizeOfFilesInDir(child);
        return total;
      }
      return 0;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  @override
  void initState() {
    loadCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserModel>(context, listen: true).user;
    return Scaffold(
        appBar: AppBar(
          title: Text("设置"),
          centerTitle: true,
        ),
        body: Builder(
          builder: (context) => Column(
            children: <Widget>[
              ListTile(
                title: Title(color: Colors.black, child: Text("账户与安全")),
                trailing: Icon(Icons.arrow_forward_ios),
                subtitle: Title(
                    color: Colors.grey,
                    child: Text(user == null ? "尚未登录" : user.nickname)),
                onTap: () {
                  if (Provider.of<UserModel>(context, listen: false).isLogin) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AccountSafe();
                    }));
                  } else {
                    Navigator.pushNamed(context, "login");
                  }
                },
              ),
              ListTile(
                title: Title(color: Colors.black, child: Text("隐私")),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Privacy();
                  }));
                },
              ),
              ListTile(
                title: Title(color: Colors.black, child: Text("意见反馈")),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CustomerService();
                  }));
                },
              ),
              ListTile(
                title: Title(color: Colors.black, child: Text("版本检测")),
                trailing: Icon(Icons.arrow_forward_ios),
                subtitle: Title(color: Colors.grey, child: Text("已是最新版本")),
                onTap: () {},
              ),
              ListTile(
                title: Title(color: Colors.black, child: Text("清除缓存")),
                subtitle: _cacheSizeStr != null ? Text(_cacheSizeStr) : null,
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () async {
                  try {
                    Directory tempDir = await getTemporaryDirectory();
                    //删除缓存目录
                    await delDir(tempDir);
                    await loadCache();
//                ToastUtils.show(msg: '清除缓存成功');
                    var snackBar = SnackBar(
                      duration: Duration(seconds: 1),
                      content: Row(
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          Text('清除缓存成功')
                        ],
                      ),
                      behavior: SnackBarBehavior.floating,
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  } catch (e) {
                    print(e);
//                ToastUtils.show(msg: '清除缓存失败');
                  } finally {
                    //此处隐藏加载loading
                  }
                },
              ),
              Provider.of<UserModel>(context, listen: false).isLogin?Container(
                padding: EdgeInsets.only(top: 30),
                child: FlatButton(
                  color: Theme.of(context).primaryColor,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    child: Text(
                      "退出登录",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    Provider.of<UserModel>(context, listen: false).user = null;
                    Provider.of<CartModel>(context, listen: false).cart = null;
                    Provider.of<OrderModel>(context, listen: false).order =
                        null;
                    Provider.of<AddressModel>(context, listen: false).address =
                        null;
                  },
                ),
              ):Text("")
            ],
          ),
        ));
  }
}
