# xzn_flutter_app
## 文件结构
```html
├─ .gitignore
├─ .metadata
├─ pubspec.lock
├─ pubspec.yaml
├─ README.md
├─ android/...
├─ assets            <!-- 本地资源 -->
│  ├─ font           <!-- 字体文件 -->
│  ├─ icon           <!-- 图标字体文件 -->
│  └─ image          <!-- 图片文件 -->
├─ ios/...
├─ lib
│  ├─ conf/...       <!-- 配置消息 -->
│  ├─ model/...      <!-- 模型类 -->
│  ├─ page/...       <!-- 页面 -->
│  ├─ services/...   <!-- 与服务器交互模块 -->
│  ├─ style/...      <!-- 软件styke -->
│  ├─ utils/...      <!-- 常用的功能，比如字符串处理和时间处理 -->
│  ├─ widget/...     <!-- 常用的公共组件，推荐，购物车按钮 -->
│  ├─ app.dart
│  ├─ loading.dart
│  └─ main.dart
└─ test
```

# xzn_flutter_app_server
## 文件结构
```html
D:.
├─ .gitignore
├─ data.dart
├─ main.dart
├─ pubspec.lock
├─ pubspec.yaml
├─ README.md
├─ standard.json
├─ utf.dart
├─ api
│  └─ */*.json
├─ assets
│  ├─ avatar
│  │  └─ *.webp
│  └─ image
│     └─ *.webp
└─ test
   └─ *.http
```