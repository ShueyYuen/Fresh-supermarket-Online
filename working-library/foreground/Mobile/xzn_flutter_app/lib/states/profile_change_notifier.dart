import 'package:flutter/material.dart';

import '../common/global.dart';

// 导入需要全局使用的模型
import '../models/profile.dart';
import '../models/user.dart';

class ProfileChangeNotifier extends ChangeNotifier{
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}

class UserModel extends ProfileChangeNotifier{
  User get user => _profile.user;
  // 是否登录
  bool get isLogin => user != null;

  set user(User user) {
    _profile.user = user;
    notifyListeners();
  }
}