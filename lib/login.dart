import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioa/route/Home.dart';
import 'package:ioa/route/RegisterRouter.dart';
import 'package:ioa/ui/LoadingDialog.dart';
import 'package:ioa/ui/NewsButton.dart';
import 'package:ioa/util/LogUtil.dart';
import 'package:toast/toast.dart';
import 'package:dio/dio.dart';

import 'constant/OAConstant.dart';

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

  bool _nameAutoFocus = true;

  bool _showLoading = false;

  int click = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> m = <Widget>[
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
//              enabledBorder: UnderlineInputBorder(
//                borderSide: BorderSide(color: Colors.blue),
//              ),
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
                      setState(() {
                        click++;
                        _showLoading = true;
                      });
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
          ],
        ),
      ),

//      TextField(
//        controller: _unameController,
//        autofocus: true,
//        decoration: InputDecoration(
//          labelText: '账号',
//          hintText: '账号或邮箱或手机号',
//          prefixIcon: Icon(Icons.person, color: Colors.black,),
//          hintStyle: TextStyle(
//            color: Colors.grey
//          ),
//          enabledBorder: UnderlineInputBorder(
//            borderSide: BorderSide(color: Colors.blue),
//          ),
//        ),
//      ),
//      TextField(
//        controller: _pwdController,
//        decoration: InputDecoration(
//          labelText: '密码',
//          hintText: '登录密码',
//          prefixIcon: Icon(Icons.lock, color: Colors.black,),
//        ),
//        obscureText: true,
//      ),
    ];
    if (_showLoading)
      m.add(FutureBuilder(
        builder: _buildFuture,
        future: _login().then((value) {
          LogUtil.v("登录获得的数据" + NewsConstant.CHAR_SEQUENCE + value.data.toString());
          setState(() {
            _showLoading = false;
            click--;
          });
          if (value.data["retCode"] == 0) {
            LogUtil.v("登录成功");
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ScaffoldRoute();
            }));
          }
          else {
            Toast.show(value.data["retMsg"].toString(), context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
          }
        }),
      ));
    else if (!_showLoading && click > 0) m.removeAt(m.length - 1);
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true,
//        leading: IconButton(icon: Icon(Icons.navigate_before), onPressed: null),
      ),
      body:
        Theme(data: Theme.of(context).copyWith(
            hintColor: Colors.blue,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.blue),
              hintStyle: TextStyle(color: Colors.grey),
            )
        ),
        child: Column(children: m))
//      Column(children: m),
    );
  }

  Future _login() async {
    LogUtil.v(_unameController.text + ":" + _pwdController.text);
    var jsonData = {
      "loginname": _unameController.text,
      "passwd": _pwdController.text
    };
    LogUtil.v(jsonData);
    var dio = Dio();
    dio.options.connectTimeout = NewsConstant.CONNECT_TIMEOUT;
    dio.options.receiveTimeout = NewsConstant.RECEIVE_TIMEOUT;
    Response response = await dio.post(NewsConstant.BASE_URL + "/login", data: jsonData);
    return response;
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return null;
      case ConnectionState.active:
        LogUtil.v('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        LogUtil.v('waiting');
        return LoadingDialog(text: "加载中.....请稍等");
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) {
          LogUtil.v('Error: ${snapshot.error}');
          return AlertDialog(
            title: Text("提示"),
            content: Text("网络连接失败，请检查网络设置"),
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop(true);
                  },
                  child: Text("确定")
              ),
            ],
          );
        }
        break;
      default:
        return null;
    }
  }
}

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Second Page');
  }
}
