import 'package:flutter/material.dart';

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
      Widget tmp = Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Checkbox(
                  value: false,
                  onChanged: null
              ),
            ),
            Expanded(
                flex: 9,
                child:  ListTile(
                    title: Text("MacBook Pro 2020"),
                    leading: avatar,
                    subtitle: Text(
                        "￥14000",
                        style: TextStyle(color: Colors.red)
                    )
                )
            )
          ]
      );
      skus.add(tmp);
    }
    return ListView(
      children: <Widget>[
        Card(
          color: Colors.white,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          clipBehavior: Clip.antiAlias,
          semanticContainer: false,
          child: Column(
            children: skus
          )
        )
      ],
    );
  }

}