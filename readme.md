绿源APP介绍
==
技术特点
--
该项目使用了基于Google全新的开发语言-Dart，及该语言的跨平台UI框架-Flutter，可以直接调用GPU对设备进行绘画，运行效率极高，完美兼容于IOS与安卓两个平台，服务端采用了基于Java编程语言的Spring Boot框架，完全前后端分离，并且配有基于Vue + Element UI的CMS系统。

开发环境
--
客户端
--
* 系统： Mac OS X Catalina (10.15.4)
* IDE：  Android Studio 3.6 / X Code 11.3
* Flutter：Flutter 1.9
* Dart：Dart 2.5

服务端
--
* 系统： CentOS 7 /  Mac OS X Catalina (10.15.4)
* JDK版本：JDK 1.8.0_231
* IDE：IntelliJ IDEA 2017
* 数据库：MySQL 5.7 社区版
* 项目工具：Maven 3.6
* 中间件：Redis


测试环境
--
+ 基于 Android 7.0  的华为
+ 基于Android 8.0的金立S8
+ 基于IOS 13.4的Iphone SE 2

开发者链接
--
+ [CSDN博客](https://blog.csdn.net/qq_39694327)
+ [Gitee](https://gitee.com/x745567172)
+ [GitHub](https://github.com/jjva-xiao)

APP效果展示
--
 ![登录页面](https://images.gitee.com/uploads/images/2020/0529/164424_de45df1f_5032734.png "show.PNG")
 ![首页](https://images.gitee.com/uploads/images/2020/0529/164601_c5a7af82_5032734.png "show1.PNG")
 ![用户信息预览](https://images.gitee.com/uploads/images/2020/0529/164622_1dc5d70d_5032734.png "show2.PNG")
--
### 更多效果可以点击下载APP

***
## 如何运行项目？

1. 检查本机环境是否与文档上文的开发环境兼容
2. 下载本项目代码，在工程目录liveshop下的liver_shop_client文件夹下运行命令 flutter create . (英文句号)
3. 编辑项目目录下的/live_shop_server/src/main/java/resources/application.yml文件，修改数据库的url，账号与密码（默认本地），修改 Redis 的 URL，用户名与密码 ，stmp邮件服务器的相关配置,将live_shop_server/live_shop.sql 文件 运行于本地的 MySQL 5.7的数据库, 
4. 在live_shop_server目录下使用 mvn install 命令打包服务端为 jar文件，并 使用命令 java -jar live_shop_server.jar 命令运行服务端
5. 编辑live_shop_client/lib/constant/BasicConstants.dart文件,修改  basicUrl 属性，改为 你服务端的地址
6. 使用flutter run命令运行项目

  
