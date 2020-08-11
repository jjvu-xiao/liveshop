import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:liveshop/route/RouterHandler.dart';
import 'package:liveshop/util/LogUtil.dart';

class Routers {

  static String root = '/';

  static String indexPage = '/index';

  static String normalPage = '/normalPage';

  static String routingReference = '/routingReference';

  static String login = '/login';

  static String register = '/register';

  static String editInfo = '/editInfo';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        LogUtil.v('ERROR====>ROUTE WAS NOT FONUND!!!'); // 找不到路由，跳转404页面
        LogUtil.v('找不到路由，404');
      },
    );

    // 路由页面配置
    router.define(indexPage, handler: indexPageHander);
//    router.define(normalPage, handler: normalPageHanderl);
//    router.define(routingReference, handler: routingReferenceHanderl);
    router.define(login, handler: loginHanderl);

    router.define(register, handler: registerHandler);
    
    router.define(editInfo, handler: profileHandler);
  }
}
