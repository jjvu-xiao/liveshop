import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ioa/constant/OAConstant.dart';
import 'package:ioa/util/LogUtil.dart';

class RoomList extends StatefulWidget {
  @override
  _RoomListState createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  List<Widget> _icons = []; //保存Icon数据

  int _nowPage = 0;

  void _getData() async {
    LogUtil.v("开始获取房间信息");
    var dio = Dio();
    dio.options.connectTimeout = NewsConstant.CONNECT_TIMEOUT;
    dio.options.receiveTimeout = NewsConstant.RECEIVE_TIMEOUT;
    var json = {"page": ++_nowPage};
    Response response = await dio.post(NewsConstant.BASE_URL, data: json);
    var data = response.data;

    Future.delayed(Duration(milliseconds: 5000)).then((e) {
      setState(() {
        for (int i = 0; i < 4; i++) {
          _icons.add(Container(
            decoration: new BoxDecoration(
                border: new Border.all(width: 10.0, color: Colors.black38),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0))),
            margin: const EdgeInsets.all(4.0),
            child: new Image.asset('images/phone$i".png'),
          ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1.0),
      itemCount: 4,
      itemBuilder: (context, index) {
        if (index == _icons.length - 1 && _icons.length < 200) {
          _getData();
        }
        return _icons[index];
      },
    );

//    var container = new Container(
//        decoration: new BoxDecoration(
//          color: Colors.black26,
//        ),
//        child: new Column(
//            children: [
//              new Row(
//                  children: [
//                    new Expanded(
//                        child: new Container(
//                          decoration: new BoxDecoration(
//                              border: new Border.all(width: 10.0, color: Colors.black38),
//                              borderRadius: const BorderRadius.all(const Radius.circular(8.0))
//                          ),
//                          margin: const EdgeInsets.all(4.0),
//                          child: new Image.asset('images/phone1.png'),
//                        )
//                    ),
//                    new Expanded(
//                        child: new Container(
//                          decoration: new BoxDecoration(
//                              border: new Border.all(width: 10.0, color: Colors.black38),
//                              borderRadius: const BorderRadius.all(const Radius.circular(8.0))
//                          ),
//                          margin: const EdgeInsets.all(4.0),
//                          child: new Image.asset('images/phone2.png'),
//                        )
//                    ),
//                  ]
//              ),
//              new Row(
//                  children: [
//                    new Expanded(
//                        child: new Container(
//                          decoration: new BoxDecoration(
//                              border: new Border.all(width: 10.0, color: Colors.black38),
//                              borderRadius: const BorderRadius.all(const Radius.circular(8.0))
//                          ),
//                          margin: const EdgeInsets.all(4.0),
//                          child: new Image.asset('images/phone3.png'),
//                        )
//                    ),
//                    new Expanded(
//                        child: new Container(
//                          decoration: new BoxDecoration(
//                              border: new Border.all(width: 10.0, color: Colors.black38),
//                              borderRadius: const BorderRadius.all(const Radius.circular(8.0))
//                          ),
//                          margin: const EdgeInsets.all(4.0),
//                          child: new Image.asset('images/phone4.png'),
//                        )
//                    ),
//                  ]
//              ),
//            ]
//        )
//    );
//    return container;
  }
}
