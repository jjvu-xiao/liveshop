
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:liveshop/route/HomeRoute.dart';
import 'package:liveshop/route/RegisterRouter.dart';
import 'package:liveshop/widget/LoadingDialog.dart';
import 'package:liveshop/widget/NewsButton.dart';
import 'package:liveshop/util/LogUtil.dart';
import 'package:toast/toast.dart';
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
                      EasyLoading.showProgress(0.3, status: "加载中......");
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
      ),
    ];
    if (_showLoading)
      m.add(FutureBuilder(
        builder: _buildFuture,
        future: _login().then((value) {
          setState(() {
            _showLoading = false;
            click--;
          });
//          Toast.show("登录成功", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ScaffoldRoute();
          }));
        }),
      ));
    else if (!_showLoading && click > 0) m.removeAt(m.length - 1);
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true,
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
    );
  }

  // 模拟登录功能
  Future<String> _login() async {
    return Future.delayed(Duration(seconds: 3), () {
        LogUtil.e("登录成功");
        return "登录成功";
      });
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
        EasyLoading.show(status: 'loading...');
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
