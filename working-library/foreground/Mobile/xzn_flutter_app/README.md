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
```bash
flutter packages pub run json_model
```
## intl_translation
```bash
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n/arb app_string.dart
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/app_string.dart lib/l10n/arb/intl_*.arb
```
最后一条命令建议使用bash运行

# 指纹信息
```bash
$> keytool -list -v -keystore "\.and
roid\debug.keystore" -alias androiddebugkey -storepass android -keypass android
别名: androiddebugkey
创建日期: 2020-2-3
条目类型: PrivateKeyEntry
证书链长度: 1
证书[1]:
所有者: C=US, O=Android, CN=Android Debug
发布者: C=US, O=Android, CN=Android Debug
序列号: 1
有效期为 Mon Feb 03 13:13:59 CST 2020 至 Wed Jan 26 13:13:59 CST 2050
证书指纹:
         MD5:  97:70:54:0D:55:00:8B:B5:10:56:32:42:0B:C6:08:BF
         SHA1: 30:04:1B:5A:EA:96:A1:E8:78:26:44:15:5B:37:81:EB:0F:DF:FC:41
         SHA256: 57:42:D9:2F:E9:9A:D8:EB:82:EB:46:88:B5:97:2B:91:F7:0C:CB:E5:83:06:4C:1C:F6:6E:15:4E:01:6F:BC:69
签名算法名称: SHA1withRSA
主体公共密钥算法: 2048 位 RSA 密钥
版本: 1
```
