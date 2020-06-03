import 'package:flutter/material.dart';
import 'package:ioa/widget/ListOptionsItem.dart';
// 用户编辑信息界面
class EditInfoRoute extends StatefulWidget {

  @override
  _EditInfoRouteState createState() => _EditInfoRouteState();

}

class _EditInfoRouteState extends State<EditInfoRoute> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("个人信息"),
        centerTitle: true
      ),
      body:  MediaQuery.removePadding(
        context: context,
        child:  ListView(
          children: <Widget>[
            ListOptionItem(Icons.person, "头像"),
            ListOptionItem(Icons.cake, "生日"),
            ListOptionItem(Icons.pregnant_woman, "性别"),
            ListOptionItem(Icons.work, "公司"),
            ListOptionItem(Icons.school, "学校"),
          ],
        )
      )
    );
  }

}