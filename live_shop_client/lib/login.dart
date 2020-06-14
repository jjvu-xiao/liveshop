
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liveshop/route/HomeRoute.dart';
import 'package:liveshop/route/RegisterRouter.dart';
import 'package:liveshop/widget/NewsButton.dart';
import 'package:liveshop/util/LogUtil.dart';
import 'package:liveshop/constant/OAConstant.dart';

/**
 * 登录页面
 */
class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  // 账号
  TextEditingController _unameController = new TextEditingController();

  // 密码
  TextEditingController _pwdController = new TextEditingController();

  bool pwdShow = false; //密码是否显示明文

  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true,
      ),
      body:
        Theme(
          data:
          Theme.of(context).copyWith(
            hintColor: Colors.blue,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.blue),
              hintStyle: TextStyle(color: Colors.grey),
            )
          ),
          child:
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: '账号',
                    hintText: '账号或邮箱或手机号',
                    prefixIcon: Icon(Icons.person, color: Colors.black,),
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "账号不能为空";
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '登录密码',
                    prefixIcon: Icon(Icons.lock, color: Colors.black,),
                  ),
                  obscureText: true,
                  validator: (v) {
                    return v.trim().length > 0 ? null : "密码不能为空";
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: NewsBlockButton("登录", Colors.blue, () {
                          EasyLoading.show(status: "加载中");
                          _login();
                        }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: NewsBlockButton("注册", Colors.red, () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return RegisterRouter();
                          }));
                        }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Image.network(NewsConstant.basicUrl + "/captcha.jpg")
                      ),
                    ],
                  ),
                )
            ],
          ),
        ))
    );
  }

  // 模拟登录功能
  Future<String> _login() async {
    // ignore: missing_return
    return Future.delayed(Duration(seconds: 3), () async {
        EasyLoading.showSuccess('登录成功');
        Future.delayed(Duration(seconds: 1), () {
          EasyLoading.dismiss();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ScaffoldRoute();
          }));
          LogUtil.e("登录成功");
          return "登录成功";
        });
//        Fluttertoast.showToast(
//            msg: "登录成功",
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.BOTTOM,
//            timeInSecForIos: 1
//        );
      });
  }
}