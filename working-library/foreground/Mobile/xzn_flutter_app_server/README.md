# xzn_flutter_app_server

## 使用

```powershell
dart main.dart *.*.*.* 8080
```
参数一:电脑上开发手机可以访问的IP地址,默认`0.0.0.0`;

参数二:端口号, 默认为`6080`;

### 查看方式

```powershell
ipconfig
```
```powershell
以太网适配器 以太网:

   连接特定的 DNS 后缀 . . . . . . . :
   本地链接 IPv6 地址. . . . . . . . : :::::%0
   IPv4 地址 . . . . . . . . . . . . : 192.168.*.*
   子网掩码  . . . . . . . . . . . . : 255.255.255.0
   默认网关. . . . . . . . . . . . . : 192.168.*.
```
默认端口为6080,可以设置命令行第二个参数修改端口.

### 配置API格式

数据格式说明：

| key                      | 对应输出                                    |
| ------------------------ | -------------------------------------------|
| **0**                    | 随机小数                                    |
| **1**                    | [0,1]区间的小数                             |
| **2**                    | [0,1000]区间的整数                          |
| **"image"**              | assets/image/下的文件名，不包括后缀          |
| **"avatar"**             | assets/avatar/下的文件名，不包括后缀         |
| **"time,yymmdd hhmmss"** | 返回时间，并且设置格式，默认为yymmdd hhmmss   |
| **""**                   | 随机字符串，最长不超过40                     |
| **"nickname"**           | 随机用户名                                  |
| **"email"**              | 随机邮箱                                    |
| **"city"**               | 随机城市                                    |
| **"food"**               | 随机食物                                    |
| **"sentence"**           | 随机句子                                    |
| **"sentences"**          | 随机段落                                    |
| **"10"**                 | 随机字符串，设定长度为10                     |
| **"num,11"**             | 字符串为数字，长度为11                       |
| **"alpha,10"**           | 字符串为字母，长度为10                       |
| **"enum[1,2,3]"**        | 枚举属性                                    |
| **"lowwerhash,11"**      | hash值，此处表示MD*值，小写表示，长度为11     |
| **"upperhash,12"**       | hash值，此处表示MD*值，大写表示，长度为12     |
> 默认列表元素的子元素最大为6，且不允许修改(因为我不会)

### YAML文件

记录token对应的资源, 格式如下：

```yaml
c47e911c018eb34de750febedf5b1e9f:
   - avatar: load
```

## 测试
可以使用VSCode的REST Client,或者自己写代码请求本地数据.
```http
POST http://192.168.42.224:6080/api/user/cart/query HTTP/1.1
content-type: application/json

{
    "token": "1sda245dsf245sdf2sd"
}
```