//
import 'package:flutter/material.dart';

class LobbyRoute extends StatefulWidget {
  @override
  LobbyRouteState createState() {
    // TODO: implement createState
    return LobbyRouteState();
  }
}

class LobbyRouteState extends State<LobbyRoute> {
  String _operation = "No Gesture detected!"; //保存事件名

  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  Widget avatar = Image.asset(
    "images/my.jpg",
    width: 50.0,
    height: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> widgets = new List();
    for (var i = 0; i < 10; i++) {
      var tmp =  Container(
        padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Amay"),
              leading: ClipOval(
                child: avatar,
              ),
              subtitle: Text("36分钟以前推荐"),
              trailing: Icon(Icons.share),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(80, 0, 10, 0),
              child: Text(
                  '''装修也好，护肤品也好，貌似和《太阳的后裔》没什么关系，但作者巧妙地把两者结合起来，借助热点为自己的产品做一个营销。这真是满满的套路啊。一篇好的朋友圈文案，一定要懂得客户需求'''
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    flex: 8,
                    child: Text("")
                ),
                Expanded(
                  flex: 1,
                  child: Icon(Icons.star),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(Icons.bubble_chart),
                )
              ],
            )
          ],
        ),
      );
      widgets.add(tmp);
    }
    return
      GestureDetector(
      child:
       ListView(
          children: <Widget>[
            Column(
              children: widgets
            ),
          ],
        )
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
