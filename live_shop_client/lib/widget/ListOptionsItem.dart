import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:liveshop/constant/OAConstant.dart';

class ListOptionItem  extends StatefulWidget {

  m.IconData _mainIcon;

  String _content;

  ListOptionItem(mainIcon, content) {
    this._mainIcon = mainIcon;
    this._content = content;
  }

  @override
  ListOptionItemState createState() => ListOptionItemState(_mainIcon, _content);
}

class ListOptionItemState extends State {

  m.IconData _mainIcon;

  String _content;

  ListOptionItemState(mainIcon, content) {
    this._mainIcon = mainIcon;
    this._content = content;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      child: ListTile(
        leading: Icon(_mainIcon, color: Colors.black,),
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          _content,
          style: TextStyle(
              fontSize: NewsConstant.FONT_SIZE,
              color: Colors.black87,
              fontWeight: FontWeight.normal
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.blue, //边框颜色
          ),
        ),
      ),
    );
  }

}