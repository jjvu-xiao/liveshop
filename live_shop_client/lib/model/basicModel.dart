import 'dart:collection';

import 'package:flutter/widgets.dart';

class BasicModel {
  int code;
  String msg;
  // HashMap 
  BasicModel({this.code, this.msg});
}

class SkuModel {
  Image image;
  String title;
  SkuModel({this.title, this.image});
}
