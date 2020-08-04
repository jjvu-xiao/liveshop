import 'package:flutter/material.dart';
import 'package:liveshop/common/AppConstants.dart';

class ListOptionItem  extends StatefulWidget {

  IconData _mainIcon;

  String _content;

  Function onClick;

  ListOptionItem(mainIcon, content, onClick) {
    this._mainIcon = mainIcon;
    this._content = content;
    this.onClick = onClick;
  }

  @override
  ListOptionItemState createState() => ListOptionItemState(_mainIcon, _content, onClick);
}

class ListOptionItemState extends State<ListOptionItem> {

  IconData _mainIcon;

  String _content;

  Function onClick;

  bool isActive = false;

  ListOptionItemState(mainIcon, content, onClick) {
    this._mainIcon = mainIcon;
    this._content = content;
    this.onClick = onClick;
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
              fontSize: AppConstants.FONT_SIZE,
              color: Colors.black87,
              fontWeight: FontWeight.normal
          ),
        ),
        onTap: this.onClick
      ),
      decoration: BoxDecoration(
        color: !isActive ? Colors.white : Colors.lightBlue,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.blue, //边框颜色
          ),
        ),
      )
    );
  }
}