import 'package:flutter/material.dart';
import 'package:ioa/widget/AddSubtractInput.dart';

/// 购物车模块
/// create by xiao
class CaretRoute extends StatefulWidget {
  @override
  _CaretRouteState createState() => _CaretRouteState();
}

class _CaretRouteState extends State<CaretRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget avatar = Image.asset(
      "images/macbookpro.jpg",
      width: 100.0,
      height: 100.0,
    );
    List<Widget> skus = new List();
    for (var i = 0; i < 10; i++) {
      Widget tmp = Column(
        children: <Widget>[
          Row(
            children: <Widget>[
            Expanded(flex: 1, child: Radio(value: false, onChanged: null)),
            Expanded(
                flex: 9,
                child: ListTile(
                  title: Text("Apple专卖店"),
                  leading: Icon(Icons.laptop),
                )),
          ]),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Radio(
                      value: false,
                      onChanged: null
                  )
              ),
              Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: avatar,
                  )
              ),
              Expanded(
                  flex: 6,
                  child: Column(
                    children: <Widget>[
                      DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0), //3像素圆角
                          ),
                          child:  Padding(
                              child:  Text(
                                  '''Apple / 苹果 16英寸 MacBook Pro 2.6GHz 6核处理器'''
                              ),
                              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0)
                          )
                      ),
                      DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0), //3像素圆角
                          ),
                          child:  Align(
                              alignment: Alignment.centerLeft,
                              child:  Padding(
                                 padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                                 child:  Text(
                                     '''银色''',
                                     style: TextStyle(
                                       color: Colors.grey,
                                     )
                                 )
                              )
                          )
                      ),
                      Row(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child:  Padding(
                                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                                  child:  Text(
                                      '''￥ 16000''',
                                      style: TextStyle(
                                        color: Colors.red,
                                      )
                                  )
                              )
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: AddSubtractInput()
//                            Row(
//                              children: <Widget>[
//                                FlatButton(onPressed: null, child: Icon(Icons.add)),
//                                Text("1"),
//                                FlatButton(onPressed: null, child: Icon(Icons.minimize))
//                              ],
//                            )
                          )
                        ],
                      ),
                    ],
                  )
              )
            ],
          )
        ]
      );
      skus.add(tmp);
    }
    return ListView(
      shrinkWrap: true,
      children: skus,
    ) ;
  }
}
