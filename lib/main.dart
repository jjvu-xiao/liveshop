import 'dart:core' as c;
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioa/login.dart';

import 'util/LogUtil.dart';

void main() => runApp(new IOAApp());

class IOAApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    LogUtil.init(isDebug: true);
    return MaterialApp(
      title: 'OA移动平台',
      theme: ThemeData(
          primaryColor: Colors.white
      ),
      home: LoginRoute(),
    );
  }
}

