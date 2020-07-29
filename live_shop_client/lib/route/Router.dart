import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:liveshop/route/RouterHandler.dart';
import 'package:liveshop/util/LogUtil.dart';

/// 路由表
/// Xiao
/// 2020-07-28
class Routes {
  static String root = "/";
  static String home = "/home";
  static Router router;

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        LogUtil.v("route is not find !");
    });
    router.define(home, handler: homeHandler);
    Routes.router = router;
  }
}