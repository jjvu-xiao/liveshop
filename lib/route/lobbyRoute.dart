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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: GestureDetector(
        //指定宽度，高度自适应
        child: Image.asset("images/phone1.png", width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            //缩放倍数在0.8到10倍之间
            _width = 200 * details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
