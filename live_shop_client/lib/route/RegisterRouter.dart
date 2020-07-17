import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:liveshop/constant/OAConstant.dart';
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

  Future _getCode() async {
    LogUtil.v("Start get Validate Code");
    var jsonData = {
      "email" : _telController.text
    };
    LogUtil.v(jsonData);
    var dio = Dio();
    dio.options.connectTimeout = NewsConstant.CONNECT_TIMEOUT;
    dio.options.receiveTimeout = NewsConstant.RECEIVE_TIMEOUT;
    Response response = await dio.post(NewsConstant.basicUrl + "/validateEmail",
        data: _telController.text);
    if (response.data['code'] == 200)
      EasyLoading.showSuccess(response.data['msg']);
    else {
      EasyLoading.showError(response.data['msg']);
    }
    return response;
  }

  _submitCode() async {
    LogUtil.v("Start submit Validate Code");
    var jsonData = {
      "email" : _telController.text,
      "code" : _codeController.text
    };
    LogUtil.v(jsonData);
    var dio = Dio();
    dio.options.connectTimeout = NewsConstant.CONNECT_TIMEOUT;
    dio.options.receiveTimeout = NewsConstant.RECEIVE_TIMEOUT;
    Response response = await dio.post(NewsConstant.basicUrl  + "/registerByEmail",
        data: _codeController.text);
    LogUtil.v("received " + response.data);
    if (response.data['code'] == 200)
      EasyLoading.showSuccess(response.data['msg']);
    else {
      EasyLoading.showError(response.data['msg']);
    }
    // return response;
  }
}
