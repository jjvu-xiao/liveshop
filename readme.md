绿源APP介绍
==
技术特点
--
该项目使用了基于Google全新的开发语言-Dart，及该语言的跨平台UI框架-Flutter，可以直接调用GPU对设备进行绘画，运行效率极高，完美兼容于IOS与安卓两个平台
采用了基于Web的CMS管理系统，用来管理后台数据，前端采用了基于Vue技术栈的axios + Element UI搭建admin前端界面，服务端采用了基于Spring Boot的Java后端。
整个项目完全前后端分离，真正实现了一个服务端 + Web + 移动端的完整产品链，可供想学习Java EE 技术或者Web技术或者移动端开发的人一个良好的参考或者脚手架

### 该版本更新说明
> #### 本次版本 v1.2 
> #### 更新说明
> 1. 完成了登录功能，并提供了图片验证码
> 2. 完了邮箱注册功能，会发送一封注册邮件到邮箱
> 3. 完了用户首次注册之后的信息编辑页面
> 4. 引入了拍照，选择相册，选择城市地区组件
> 5. 修复了验证码无法刷新的问题
> 6. 修复了邮件无法发送的问题
> 7. 提高了客户端得到运行效率
> 8. 增强了服务端的并发性能
> 9. IOS编译IDE 由原来的XCode 11.3升级为XCode 11.6

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
* 服务器技术：Spring Boot 2.2

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
 ![登录页面](https://images.gitee.com/uploads/images/2020/0813/111033_3277640a_5032734.jpeg "image1.jpg")
 ![注册页面](https://images.gitee.com/uploads/images/2020/0813/111131_d202cb9f_5032734.jpeg "image0.jpg")
 ![选择相册或者拍照](https://images.gitee.com/uploads/images/2020/0813/111222_a708acaf_5032734.jpeg "image2.JPG")
 ![个人信息编辑](https://images.gitee.com/uploads/images/2020/0813/111305_37afa300_5032734.jpeg "image3.JPG")
 ![选择城市地区](https://images.gitee.com/uploads/images/2020/0813/111346_8d106c06_5032734.jpeg "image4.JPG")
 ![登录成功后](https://images.gitee.com/uploads/images/2020/0813/111402_96fc54d4_5032734.jpeg "image5.jpg")
 ![主页](https://images.gitee.com/uploads/images/2020/0813/111544_bb073502_5032734.jpeg "image6.jpg")
--
### 更多效果可以点击下载APP

 
### 如何运行项目？（因为本项目不是使用mock来模拟服务端的，所以需要先搭建本项目的服务端环境）

1. 检查本机环境是否与上文的开发环境兼容
2. 搭建数据库环境，使用Navicat for mysql工具 导入 live_shop_server文件夹下的live_shop.sql文件
![新建数据库](https://images.gitee.com/uploads/images/2020/0704/231708_d63fc51e_5032734.jpeg "step1.JPG")
![运行sql文件](https://images.gitee.com/uploads/images/2020/0704/231946_02965579_5032734.jpeg "step2.JPG")
3. 在idea中导入live_shop_server文件夹，在工程中更改 src/main/resources/application.yml，主要是这么几个字段，
数据库的url，username，password、邮箱mail下的host，port，username，password字段，还有redis的url，username，password
配置都有注释，可以根据注释找到对应的字段根据自己环境进行更改配置，本项目用到了FastDFS文件上传需要配置文件服务器，需要进入到\live_shop_server\src\main\resources\fastdfs-client.properties文件中根据注释添加FastDFS服务器的URL，并且需要将live_shop_server/lib文件夹下的fastdfs-client-java-1.29-SNAPSHOT.jar导入到本地的maven仓库
参考命令  `mvn install:install-file -Dfile=E:\fastdfs-client-java-1.29-SNAPSHOT.jar -Dgroup=org.csource -DartifactId=fastdfs-client-java -Dversion=1.0.0 -Dpackage=jar` 其中-Dfile字段为 你的电脑上的这个jar包的绝对路径
![服务端的application.yml配置](https://images.gitee.com/uploads/images/2020/0704/232846_7744c555_5032734.jpeg "step3.JPG")
4. 使用Visual Studio Code 进入到 live_shop_web文件夹内，使用node install 命令编译构建Web工程，编译构建成功后使用node run start 命令运行Web环境
![Web前端工程](https://images.gitee.com/uploads/images/2020/0704/233452_5f843400_5032734.jpeg "step4.JPG")
5. 打开Android Studio导入 live_shop_client的文件夹，Android Studio会自动初始化工程


后续会逐渐推出 Docker 版本工程，敬请期待。码字不易，请给个Star鼓励一下
---
