import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioa/constant/OAConstant.dart';
import 'package:ioa/ui/NewsButton.dart';
import 'package:ioa/util/LogUtil.dart';

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
              labelText: '手机号',
              hintText: '请输入绑定的手机号',
              prefixIcon: Icon(Icons.mobile_screen_share),
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
    Response response = await dio.post(NewsConstant.BASE_URL + "/registerUser",
        data: jsonData);
    return response;
  }

  Future _submitCode() async {
    LogUtil.v("Start submit Validate Code");
    var jsonData = {
      "email" : _telController.text,
      "code" : _codeController.text
    };
    LogUtil.v(jsonData);
    var dio = Dio();
    dio.options.connectTimeout = NewsConstant.CONNECT_TIMEOUT;
    dio.options.receiveTimeout = NewsConstant.RECEIVE_TIMEOUT;
    Response response = await dio.post(NewsConstant.BASE_URL + "/validateSubmit",
        data: jsonData);
    LogUtil.v("received " + response.data);
    return response;
  }
}
