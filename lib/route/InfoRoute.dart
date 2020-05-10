import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 我的设置页
 */
class InfoRoute extends StatefulWidget {
  @override
  _InfoRouteState createState() => _InfoRouteState();
}

class _InfoRouteState extends State {
  Widget avatar = Image.asset(
    "images/my.jpg",
    width: 50.0,
    height: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        Container(
          child: ListTile(
            leading: ClipOval(
              child: avatar,
            ),
            title: Text("我是爵哥"),
            subtitle: Text("一个90 App创作者"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
//          color: Colors.white,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.grey, //边框颜色
//                color: Colors.grey,
              ),
            ),
          ),
        ),
        Container(
          child: ListTile(
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text("设置"),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.grey, //边框颜色
//                color: Colors.grey,
              ),
            ),
          ),
        ),
        Container(
          child: ListTile(
            leading: Icon(Icons.access_time),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text("播放记录"),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.grey, //边框颜色
//                color: Colors.grey,
              ),
            ),
          ),
        ),
        Container(
          child: ListTile(
            leading: Icon(Icons.question_answer),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text("问题反馈"),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.grey, //边框颜色
//                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
