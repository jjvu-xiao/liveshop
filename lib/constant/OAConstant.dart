import 'dart:core';

import 'package:flutter/material.dart' as m;

class NewsConstant {
  // 主题颜色
  static m.Color primaryColor = m.Colors.blue;
  // 被激活时的颜色
  static m.Color activeColor = m.Colors.red;
  // 曾经访问过的颜色
  static m.Color visitedColor = m.Colors.grey;

  static m.Color PRIMARY_COLOR = m.Colors.white;
  // 服务器地址
//  static const String URL = "http://192.168.43.73:80/news/app/login";
//  static const String URL = "http://192.168.1.44:8080/news/app/login";
//  static const String URL = "http://192.168.191.1:8080/news/app/login";

//  static const String URL = "http://118.25.130.181/news/app/login";

//  static const String BASE_URL = "http://192.168.191.1:8080/news/app/";

  static const String BASE_URL = "http://118.25.130.181/news/app";

  static const int CONNECT_TIMEOUT = 300000;

  static const int RECEIVE_TIMEOUT = 600000;

  static const String CHAR_SEQUENCE = "\t";

  static const double FONT_SIZE = 14.0;
}