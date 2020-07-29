
import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:liveshop/common/AppConstants.dart';
import 'package:liveshop/route/HomeRoute.dart';
import 'package:liveshop/route/RegisterRouter.dart';
import 'package:liveshop/route/Router.dart';
import 'package:liveshop/util/HttpUtil.dart';
import 'package:liveshop/widget/NewsButton.dart';
import 'package:liveshop/util/LogUtil.dart';
import 'package:liveshop/constant/OAConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 登录页面
class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  // 账号
  TextEditingController _unameController = TextEditingController();

  // 密码
  TextEditingController _pwdController = TextEditingController();

  // 验证码
  TextEditingController _captchaController = TextEditingController();

  bool pwdShow = false; //密码是否显示明文

  final GlobalKey _formKey = new GlobalKey<FormState>();

  Image captchaImage;

  int click = 0;

  bool _nameAutoFocus = true;

  /// 获取图片验证码
  /// 自动填充上一次登录的用户名，填充后将焦点定位到密码输入框
  @override
  void initState() {
    captchaImage = Image.network(NewsConstant.basicUrl + "/captcha.jpg");
    _getLastLogin().then((lastLoginname) {
      if (null != lastLoginname) {
        _unameController.text = lastLoginname;
        this._nameAutoFocus = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('登录', style: TextStyle(fontFamily: "FlamanteRoma")),
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
                  autofocus: _nameAutoFocus,
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: '账号',
                    hintText: '账号或邮箱或手机号',
                    prefixIcon: Icon(Icons.person, color: Colors.black,),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: "LatoBold"
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "账号不能为空";
                  }
                ),
                TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '登录密码',
                    prefixIcon: Icon(Icons.lock, color: Colors.black,),
                  ),
                  obscureText: true,
                  autofocus: !_nameAutoFocus,
                  validator: (v) {
                    return v.trim().length > 0 ? null : "密码不能为空";
                  }
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextFormField(
                            controller: _captchaController,
                            decoration: InputDecoration(
                              labelText: '验证码',
                              hintText: '请输入右侧验证码',
                              hintStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              )
                            ),
                            validator: (v) {
                              return v.trim().length > 0 ? null : "验证码不能为空";
                            }
                          )
                      ),
                      Expanded(
                        child:  InkWell(
                          onTap: () {
                            setState(() {
                                this.click ++;
                                captchaImage = Image.network(NewsConstant.basicUrl + "/captcha.jpg?click=" + this.click.toString());
                            });
                          },
                          child: captchaImage
                        )
                      )
                    ]
                  )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: NewsBlockButton("登录", Colors.blue, () {
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
                        child: NewsBlockButton("游客进入", Colors.red, () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return HomeRoute();
                          }));
                        })
                      )
                    ]
                  )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return RegisterRouter();
                              }));
                            },
                            child: Text(
                              "注册",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18.0,
                                height: 1.2,
                                decoration: TextDecoration.underline,
                              )
                            )
                          )
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return RegisterRouter();
                              }));
                            },
                            child: Text(
                              "忘记密码",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18.0,
                                height: 1.2,
                                decoration: TextDecoration.underline,
                              )
                            )
                          )
                      )
                    ]
                  )
                )
            ]
          )
        ))
    );
  }

  /// 登录功能
  /// 提交前先验证每个字段是否合法
  /// 登录成功时，将登录的账号记录在本地
  void _login() async {
    if ((_formKey.currentState as FormState).validate()) {
      EasyLoading.show(status: "加载中");
      var loginname = _unameController.text.trim();
      var passwd = _pwdController.text.trim();
      var captcha = _captchaController.text.trim();
      String callback = await HttpUtil.post(url: AppConstants.BASE_URL + "/login",
          data:{"account" : loginname, "password" : passwd, "captcha" : captcha});
      Map data = jsonDecode(callback);
      LogUtil.v(data['msg']);
      if (data['code'] == 200) {
        EasyLoading.showSuccess(data['msg']);
        _saveLastLogin();
      }
      else {
        EasyLoading.showError(data['msg']);
        return;
      }
      await Future.delayed(Duration(seconds: 1), () {
        EasyLoading.dismiss();
//        Routes.router.navigateTo(context, '${Routes.home}?id=1', transition: TransitionType.inFromRight)
//        .then((result) {
//          LogUtil.v(result);
//        });
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeRoute();
        }));
      });
    }
  }

  /// 获取上一次登录用户的账号信息
  Future<String> _getLastLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lastLoginName = prefs.getString("lastLoginname");
    LogUtil.v("上一次登录的账号\t" + lastLoginName, tag: "用户登录");
    return lastLoginName;
  }

  /// 保存上一次登录用户的账号信息
  void _saveLastLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loginname = _unameController.text.trim();
    prefs.setString("lastLoginname", loginname);
    LogUtil.v("账号\t$loginname\t登录成功", tag: "用户登录");
  }
}