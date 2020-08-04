import 'package:flutter/material.dart';
import 'package:liveshop/common/AppConstants.dart';
/// 消息页
class MsgRoute extends StatefulWidget {
  @override
  _MsgRouteState createState() => _MsgRouteState();
}

class _MsgRouteState extends State {
  Widget avatar = Image.asset(
    AppConstants.NATIVE_IMAGE_PATH + "my.jpg",
    width: 50.0,
    height: 50.0,
  );

  Widget divider1 = Divider(
    color: Colors.blue,
  );
  Widget divider2 = Divider(color: Colors.green);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child:
      ListView.separated(
        itemCount: 20,
//      itemExtent: ,
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        separatorBuilder: (context, index) {
          return index % 2 == 0 ? divider1 : divider2;
        },
        itemBuilder: (context, int index) {
          return ListTile(
            title: Text("我是爵哥"),
            leading: ClipOval(
              child: avatar,
            ),
            subtitle: Text("Hello  Baby"),
            trailing: Text("11:18"),
          );
        },
      )
    );
  }
}
