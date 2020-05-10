import 'package:flutter/material.dart';

/**
 * 商品卡片布局
 */
class CardWidget extends StatefulWidget {

  Image _img;

  String _title;

  CardWidget(this._img, this._title);

  @override
  CardWidgetState createState() => CardWidgetState(this._img, this._title);
}

class CardWidgetState extends State<CardWidget> {

  Image _img;

  String _title;

  CardWidgetState(this._img, this._title);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: getChild(),
    );
  }
  getChild() {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
//          Image.asset("images/phone1.png",
            _img,
//            width: 100.0,
//          ),
          Text(
            _title,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      )
    );
  }
}

//class CardWidgetList extends StatefulWidget {
//  @override
//  _CardWidgetListState createState() => _CardWidgetListState();
//
//}
//
//class _CardWidgetListState extends State<CardWidgetList> {
//
//  List<Widget> _cards = new List();
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _getData();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return ListView(
//      shrinkWrap: true,
//      physics:  NeverScrollableScrollPhysics(),
//      padding: const EdgeInsets.all(20.0),
//      children: _cards
//    );
//  }
//
//  void _getData() {
//    for (int i = 0; i < 8; i++) {
//      _cards.add(
//        Flex(
//            direction: Axis.horizontal,
//            children: <Widget>[
//              Expanded(child: CardWidget(), flex: 1),
//              Expanded(child: CardWidget(), flex: 1),
//          ]
//        )
//      );
//    }
//  }
//}