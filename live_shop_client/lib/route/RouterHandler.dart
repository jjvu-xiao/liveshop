import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:liveshop/login.dart';
import 'package:liveshop/view/EditInfoRoute.dart';
import 'package:liveshop/view/HomeRoute.dart';
import 'package:liveshop/view/RegisterRouter.dart';

/// 路由表对应的路由处理
/// xiao
/// 2020-07-28

/// handler就是每个路由的规则，编写handler就是配置路由规则，
/// 比如我们要传递参数，参数的值是什么，这些都需要在Handler中完成。

/// 首页
Handler indexPageHander = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String loginname = params['loginname'].first;
    return HomeRoute(loginname: loginname);
  },
);

//// 正常路由跳转
//Handler normalPageHanderl = Handler(
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      return NormalPage();
//    }
//);
//
//// 路由传参
//Handler routingReferenceHanderl = Handler(
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String id = params['id'].first;
//      return RoutingReference(id: id);
//    }
//);

// 登陆页面
Handler loginHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String loginname = params['loginname'].first;
      String passwd = params['passwd'].first;
      return LoginRoute(loginname: loginname, passwd: passwd);
    }
);

// 注册页面
Handler registerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return RegisterRouter();
    }
);

// 用户信息编辑页面
Handler profileHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String loginname = params['loginname'].first;
      String method = params['method'].first;
      return EditInfoRoute(loginname: loginname, method: method);
    }
);
