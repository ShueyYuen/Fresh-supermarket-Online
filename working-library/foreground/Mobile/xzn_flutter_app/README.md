# xzn

A new Flutter application serving monkeys

## 启动
```powershell
flutter run --debug
```
开始后出现以下错误：
```powershell
D/skia    ( 5433): Shader compilation error
D/skia    ( 5433): ------------------------
D/skia    ( 5433): Errors:
D/skia    ( 5433): 
```
需要清理之前生成的apk文件.
```powershell
flutter clean
```

## 注意事项
1. 添加assets资源后，部分资源可能没法使用，比如字体，需要重启软件！

## 第三方资源管理
[iconfont](https://www.iconfont.cn/): 图标文件;

## json_model使用
```dart
flutter packages pub run json_model
```