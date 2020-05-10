import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:ioa/constant/OAConstant.dart';

/**
 *  块状圆角按钮
 */
class NewsBlockButton extends StatefulWidget {
  String _text = "确定";

  // 当前显示颜色
  m.Color showColor = NewsConstant.primaryColor;

  var _pressFunction;

  NewsBlockButton(String text, m.Color showColor, pressFunction) {
    this._text = text;
    this.showColor = showColor;
    this._pressFunction = pressFunction;
  }

  @override
  _NewsBlockButton createState() =>
      _NewsBlockButton(_text, showColor, _pressFunction);
}

class _NewsBlockButton extends State<NewsBlockButton> {
  _NewsBlockButton(String text, m.Color showColor, _pressFunction) {
    this._text = text;
    this.showColor = showColor;
    this._pressFunction = _pressFunction;
  }

  String _text;

  // 当前显示颜色
  m.Color showColor;

  // 点击处理
  var _pressFunction;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      color: showColor,
      highlightColor: Colors.blue[700],
      colorBrightness: Brightness.dark,
      splashColor: Colors.grey,
      child: Text(_text),
      // 设置成圆角
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: this._pressFunction,
    );
  }
}
