import 'dart:core';

import 'package:flutter/material.dart';
import 'package:liveshop/common/AppConstants.dart';
import 'package:liveshop/model/basicModel.dart';

import 'CardWidget.dart';

class SkuHomeList extends StatefulWidget {
  @override
  _SkuHomeListState createState() => _SkuHomeListState();

}

class _SkuHomeListState extends State<SkuHomeList> {

  List<Widget> _cards = new List();

  List<SkuModel> datas = new List();

  List<SkuModel> leftDatas = new List();

  List<SkuModel> rightDatas = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
    initView();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        shrinkWrap: true,
        physics:  NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        children: _cards
    );
  }

  void _getData() {
    for (int i = 0; i < 6; i++) {
      String imagePath = AppConstants.NATIVE_IMAGE_PATH + "phone$i.png";
      var image = Image.asset(imagePath, width: 100.0,);
      String title = "iphone${i+1}";
      var sku = SkuModel(image: image, title: title);
      i % 2 == 0 ? leftDatas.add(sku) : rightDatas.add(sku);
    }
  }

  void initView() {
    for (int i = 0; i < rightDatas.length; i++) {
      var leftSku = CardWidget(leftDatas[i].image, leftDatas[i].title);
      var rightSku = CardWidget(rightDatas[i].image, rightDatas[i].title);
      var rowWidget = Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(child: leftSku, flex: 1,),
          Expanded(child: rightSku, flex: 1,),
        ],
      );
      _cards.add(rowWidget);
    }
  }
}