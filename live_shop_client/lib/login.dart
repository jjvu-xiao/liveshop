import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  TextEditingController _unameController = TextEditingController();

  // 密码
  TextEditingController _pwdController = TextEditingController();

  // 验证码
  TextEditingController _captchaController = TextEditingController();

  bool pwdShow = false; //密码是否显示明文

  GlobalKey _formKey = new GlobalKey<FormState>();

  Image captchaImage = null;

  int click = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    captchaImage = Image.network(NewsConstant.basicUrl + "/captcha.jpg");
  }

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
                          child: TextField(
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
                            )
                          )
                      ),
                      Expanded(
                          child: FlatButton(
                            child: Text("重新获取"),
                            onPressed: () {
                              setState(() {
                              });
                            },
                          )
                      ),
                      Expanded(
                        child:  InkWell(
                          onTap: () {
                            setState(() {
                              print("重新获取");
                            });
                          },
                          child: captchaImage
                        )
                      )
                    ],
                  ),
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
                )
            ],
          ),
        ))
    );
  }

  // 登录功能
  Future<String> _login() async {
    var loginname = _unameController.text.trim();
    var passwd = _pwdController.text.trim();
    var captcha = _captchaController.text.trim();
    Dio dio = Dio();
    Response response = await dio.post(NewsConstant.basicUrl + "/login",
        data:{"account" : loginname, "password" : passwd, "captcha" : captcha});
    String callback = response.data.toString();
    LogUtil.v(callback);
    EasyLoading.showSuccess('登录成功');
    Future.delayed(Duration(seconds: 1), () {
      EasyLoading.dismiss();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ScaffoldRoute();
      }));
      LogUtil.e("登录成功");
      return "登录成功";
    });

    return "success";
  }
}