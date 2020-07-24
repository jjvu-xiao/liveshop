import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:liveshop/route/EditInfoRoute.dart';
import 'package:liveshop/util/HttpUtil.dart';
import 'package:liveshop/widget/NewsButton.dart';
import 'package:liveshop/util/LogUtil.dart';

/// 用户注册界面
class RegisterRouter extends StatefulWidget {

  @override
  _RegisterRouterState createState() => _RegisterRouterState();

}

class _RegisterRouterState extends State<RegisterRouter> {

  // 账号
  TextEditingController _telController = new TextEditingController();

  // 验证码
  TextEditingController _codeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("用户注册"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _telController,
            decoration: InputDecoration(
              labelText: '邮箱号',
              hintText: '请输入要注册的邮箱号',
              prefixIcon: Icon(Icons.email),
              suffixIcon: FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("发送验证码"),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  _getCode();
                },
              )
            ),
            obscureText: false,
          ),
          TextField(
            controller: _codeController,
           // controller: _telController,
            decoration: InputDecoration(
              labelText: '验证码',
              hintText: '请输入短信收到的验证码',
              prefixIcon: Icon(Icons.lock_open),
            ),
            obscureText: false,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: NewsBlockButton("注册", Colors.blue, () {
                    _submitCode();
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 发送邮箱地址到服务端，服务端会发送验证码到用户的邮箱
  Future _getCode() async {
    LogUtil.v("开始获取验证码");
    var jsonData = {
      "email" : _telController.text
    };
    LogUtil.v(jsonData);
    String callback = await HttpUtil.post(url: "/validateEmail", data: _telController.text);
    Map data = jsonDecode(callback);
    if (data['code'] == 200)
      EasyLoading.showSuccess(data['msg']);
    else {
      EasyLoading.showError(data['msg']);
    }
    return data;
  }

  /// 提交验证码数据，将输入框中的验证码发送到服务器，判断code是否为200
  /// 当200的时候，显示信息，并且跳转到用户信息编辑界面
  /// 不为200的时候，只显示报错信息
  _submitCode() async {
    bool isSuccess = false;
    LogUtil.v("提交注册用户的邮箱与邮箱验证码");
    var jsonData = {
      "email" : _telController.text,
      "code" : _codeController.text
    };
    String callback = await HttpUtil.post(url: "/registerByEmail", data: jsonData);
    Map data = jsonDecode(callback);
    LogUtil.v(data.runtimeType);
    if (data["code"] == 200) {
      EasyLoading.showSuccess(data['msg']);
      isSuccess = true;
    }
    else {
      EasyLoading.showError(data['msg']);

    }
    await Future.delayed(Duration(seconds: 1));
      if (isSuccess)
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditInfoRoute();
        }));
      else
        return;
  }
}
