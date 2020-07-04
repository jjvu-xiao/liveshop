绿源APP介绍
==
技术特点
--
该项目使用了基于Google全新的开发语言-Dart，及该语言的跨平台UI框架-Flutter，可以直接调用GPU对设备进行绘画，运行效率极高，完美兼容于IOS与安卓两个平台
采用了基于Web的CMS管理系统，用来管理后台数据，前端采用了基于Vue技术栈的axios + Element UI搭建admin前端界面，服务端采用了基于Spring Boot的Java后端。
整个项目完全前后端分离，真正实现了一个服务端 + Web + 移动端的完整产品链，可供想学习Java EE 技术或者Web技术或者移动端开发的人一个良好的参考或者脚手架


开发环境
--
客户端环境
--
* 系统： Mac OS X Catalina (10.15)
* IDE：  Android Studio 3.6 / X Code 11.3
* Flutter：Flutter 1.9
* Dart：Dart 2.5

服务端环境
--
* 系统：CentOS 7.5
* 服务容器：Nginx + Tomcat 8.5
* JDK版本：1.8.0_161
* 数据库：MySQL 5.7
* 中间件：Redis

Web端环境
--
* 环境：Node v10.16.3
* Webpack：3.6.0
* 框架技术：Vue 2.5.2 + Element UI 2.13.2 + Axios 0.19.2
* IDE：Visual Studio Code 

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

 
### 如何运行项目？（因为本项目不是使用mock来模拟服务端的，所以需要先搭建本项目的服务端环境）

1. 检查本机环境是否与上文的开发环境兼容
2. 搭建数据库环境，使用Navicat for mysql工具 导入 live_shop_server文件夹下的live_shop.sql文件
![新建数据库](https://images.gitee.com/uploads/images/2020/0704/231708_d63fc51e_5032734.jpeg "step1.JPG")
![运行sql文件](https://images.gitee.com/uploads/images/2020/0704/231946_02965579_5032734.jpeg "step2.JPG")
3. 在idea中导入live_shop_server文件夹，在工程中更改 src/main/resources/application.yml，主要是这么几个字段，
数据库的url，username，password、邮箱mail下的host，port，username，password字段，还有redis的url，username，password
配置都有注释，可以根据注释找到对应的字段根据自己环境进行更改配置。
![服务端的application.yml配置](https://images.gitee.com/uploads/images/2020/0704/232846_7744c555_5032734.jpeg "step3.JPG")
4. 使用Visual Studio Code 进入到 live_shop_web文件夹内，使用node install 命令编译构建Web工程，编译构建成功后使用node run start 命令运行Web环境
![Web前端工程](https://images.gitee.com/uploads/images/2020/0704/233452_5f843400_5032734.jpeg "step4.JPG")
5. 使用命令行cd live_shop_client 目录中，使用命令 flutter create . 会构建好flutter可执行工程
![flutter构建工程](https://images.gitee.com/uploads/images/2020/0704/233542_53a7eb74_5032734.jpeg "step5.JPG")
6. 使用Android Studio导入工程即可

后续会逐渐推出 Docker 版本工程，敬请期待。码字不易，请给个Star鼓励一下
---
