import 'dart:core';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:liveshop/login.dart';
import 'package:liveshop/route/Application.dart';
import 'package:liveshop/route/Routers.dart';
import 'package:liveshop/util/HttpUtil.dart';
import 'package:liveshop/util/LogUtil.dart';



void main() => runApp(new App());

/// 初始化Fluto路由
/// 初始化日志工具，网络请求日志，loading进度条，国际化
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routers.configureRoutes(router);
    Application.router = router;
    LogUtil.init(isDebug: true);
    HttpUtil.init();
    return FlutterEasyLoading(
      child:  MaterialApp(
          title: '绿源直播',
          onGenerateRoute: Application.router.generator,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.white
          ),
          home: LoginRoute(),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        supportedLocales: [
          const Locale('zh', 'CH'),
          const Locale('en', 'US'),
        ]
      )
    );
  }

  void configLoading() {
//    EasyLoading.instance
//      ..displayDuration = const Duration(milliseconds: 2000)
//      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
//      ..loadingStyle = EasyLoadingStyle.dark
//      ..indicatorSize = 45.0
//      ..radius = 10.0
//      ..progressColor = Colors.yellow
//      ..backgroundColor = Colors.green
//      ..indicatorColor = Colors.yellow
//      ..textColor = Colors.yellow
//      ..maskColor = Colors.blue.withOpacity(0.5)
//      ..userInteractions = true;
    }
}

