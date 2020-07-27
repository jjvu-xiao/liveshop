
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:liveshop/route/HomeRoute.dart';
import 'package:liveshop/route/RegisterRouter.dart';
import 'package:liveshop/widget/NewsButton.dart';
import 'package:liveshop/util/LogUtil.dart';
import 'package:liveshop/constant/OAConstant.dart';

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
                      // Expanded(
                      //     child: FlatButton(
                      //       child: Text("重新获取",  style: TextStyle(
                      //           color: Colors.blue,
                      //           fontSize: 18.0,
                      //           height: 1.2,
                      //           fontFamily: "宋体",
                      //           decoration:TextDecoration.underline,
                      //           decorationStyle: TextDecorationStyle.wavy
                      //       )),
                      //       onPressed: () {
                      //         setState(() {
                      //           this.click ++;
                      //           captchaImage = Image.network(NewsConstant.basicUrl + "/captcha.jpg?click=" + this.click.toString());
                      //         });
                      //       },
                      //     )
                      // ),
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

  // 登录功能
  _login() async {
    var loginname = _unameController.text.trim();
    var passwd = _pwdController.text.trim();
    var captcha = _captchaController.text.trim();
    Dio dio = Dio();
    // HttpUtil util = HttpUtil();
    // util.init();
    Response response = await Dio().post(NewsConstant.basicUrl + "/login",
        data:{"account" : loginname, "password" : passwd, "captcha" : captcha});

    // Map<String, dynamic> response = await util.post("/login", {"account" : loginname, "password" : passwd, "captcha" : captcha});
    // Map<String, dynamic> callback = await HttpManager.post("/login", {"account" : loginname, "password" : passwd, "captcha" : captcha});
    
    // callback.then( 
    // String callback = response.data;
    LogUtil.v(response.data['msg']);
    // LogUtil.v(callback.toString());
    if (response.data['code'] == 200)
      EasyLoading.showSuccess(response.data['msg']);
    else {
      EasyLoading.showError(response.data['msg']);
      return;
    }
    await Future.delayed(Duration(seconds: 1), () {
      EasyLoading.dismiss();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeRoute();
      }));
    });
    // return "success";
  }
}