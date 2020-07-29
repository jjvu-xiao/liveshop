import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:liveshop/route/HomeRoute.dart';
import 'package:liveshop/util/LogUtil.dart';

/// 路由表对应的路由处理
/// xiao
/// 2020-07-28

var homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String id = params["id"][0];
  LogUtil.v(id);
  return HomeRoute();
});

void defineRoutes(Router router) {
  router.define("/users/:id", handler: homeHandler);
}