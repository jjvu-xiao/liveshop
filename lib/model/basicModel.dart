import 'package:flutter/widgets.dart';

class BasicModel {
  int retCode;
  String retMsg;
  BasicModel({this.retCode, this.retMsg});
}

class SkuModel {
  Image image;
  String title;
  SkuModel({this.title, this.image});
}