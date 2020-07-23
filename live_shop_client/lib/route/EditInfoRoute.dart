import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:liveshop/util/LogUtil.dart';
import 'package:liveshop/widget/ListOptionsItem.dart';
// 用户编辑信息界面
class EditInfoRoute extends StatefulWidget {

  @override
  _EditInfoRouteState createState() => _EditInfoRouteState();

}

const String MIN_DATETIME = '2010-05-12';
const String MAX_DATETIME = '2021-11-25';
const String INIT_DATETIME = '2019-05-17';

class _EditInfoRouteState extends State<EditInfoRoute> {

  bool _showTitle = true;

  DateTimePickerLocale _locale = DateTimePickerLocale.zh_cn;
  List<DateTimePickerLocale> _locales = DateTimePickerLocale.values;

  String _format = 'yyyy-MMMM-dd';
  TextEditingController _formatCtrl = TextEditingController();

  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("个人信息"),
        centerTitle: true
      ),
      body:  MediaQuery.removePadding(
        context: context,
        child:  ListView(
          children: <Widget>[
            ListOptionItem(Icons.person, "头像", () {LogUtil.v("点击了头像");}),
            ListOptionItem(Icons.cake, "生日", () {
              LogUtil.v("点击了生日");
              DatePicker.showDatePicker(
                context,
                onMonthChangeStartWithFirstDate: true,
                pickerTheme: DateTimePickerTheme(
                  showTitle: _showTitle,
                  confirm: Text('custom Done', style: TextStyle(color: Colors.red)),
                ),
                minDateTime: DateTime.parse(MIN_DATETIME),
                maxDateTime: DateTime.parse(MAX_DATETIME),
                initialDateTime: _dateTime,
                dateFormat: _format,
                locale: _locale,
              // return DatePicker.showDatePicker({
              //     context,
              //     DATETIME_PICKER_LOCALE_DEFAULT,
              //     DateTimePickerMode.date
              // });
            );}),
            ListOptionItem(Icons.pregnant_woman, "性别", () {LogUtil.v("点击了头像");}),
            ListOptionItem(Icons.work, "公司", () {LogUtil.v("点击了头像");}),
            ListOptionItem(Icons.school, "学校", () {LogUtil.v("点击了头像");}),
          ],
        )
      )
    );
  }
}