import 'dart:core';
import 'package:flutter/material.dart';

class AppConstants {
  // 主题颜色
  static Color primaryColor = Colors.blue;
  // 被激活时的颜色
  static Color activeColor = Colors.red;
  // 曾经访问过的颜色
  static Color visitedColor = Colors.grey;

  static Color PRIMARY_COLOR = Colors.white;

  // 服务器地址
  static const String BASE_URL = "http://192.168.179.1:85";

  static const int CONNECT_TIMEOUT = 300000;

  static const int RECEIVE_TIMEOUT = 600000;

  static const String CHAR_SEQUENCE = "\t";

  static const double FONT_SIZE = 14.0;

  // 本地的图片路径前缀
  static const String NATIVE_IMAGE_PATH = "assets/images/";

  // 基础服务器地址
  static const basicUrl = "http://192.168.179.1:85";
}