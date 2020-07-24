
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liveshop/common/AppConstants.dart';
import 'package:liveshop/route/HomeRoute.dart';
import 'package:liveshop/util/LogUtil.dart';

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

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

//  @override
//  Future initState() async {
//    super.initState();
//    cameras = await availableCameras();
//    controller = CameraController(cameras[0], ResolutionPreset.medium);
//    controller.initialize().then((_) {
//      if (!mounted) {
//        return;
//      }
//      setState(() {});
//    });
//  }

//  @override
//  void dispose() {
//    controller?.dispose();
//    super.dispose();
//  }


  @override
  Widget build(BuildContext context) {
//    if (!controller.value.isInitialized) {
//      return Container();
//    }
//    return AspectRatio(
//        aspectRatio:
//        controller.value.aspectRatio,
//        child: CameraPreview(controller));

    return Scaffold(
      appBar: AppBar(
        title: Text("个人信息"),
        centerTitle: true
      ),
      body:  MediaQuery.removePadding(
        context: context,
        child: DecoratedBox(
          decoration: BoxDecoration(
          color: Color.fromARGB( 	245,245,245, 245)
          ),
          child: ListView(
            children: <Widget>[
              Card(
                  color: Colors.white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  clipBehavior: Clip.antiAlias,
                  semanticContainer: false,
                  child: ListTile(
                      leading: Icon(FontAwesomeIcons.user, color: Colors.black),
                      trailing: Icon(FontAwesomeIcons.camera),
                      title: Text(
                        "头像",
                        style: TextStyle(
                            fontSize: AppConstants.FONT_SIZE,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      onTap: () {
                        LogUtil.v("点击了头像");
                        getImage();
                      }
                  )
              ),

              Card(
                  color: Colors.white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  clipBehavior: Clip.antiAlias,
                  semanticContainer: false,
                  child: ListTile(
                      leading: Icon(FontAwesomeIcons.laughBeam, color: Colors.black),
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text(
                        "昵称",
                        style: TextStyle(
                            fontSize: AppConstants.FONT_SIZE,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      onTap: () {
                        LogUtil.v("点击了昵称");
                      }
                  )
              ),

              Card(
                  color: Colors.white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  clipBehavior: Clip.antiAlias,
                  semanticContainer: false,
                  child: ListTile(
                      leading: Icon(FontAwesomeIcons.birthdayCake, color: Colors.black),
                      trailing: Icon(FontAwesomeIcons.calendar),
                      title: Text(
                        "生日",
                        style: TextStyle(
                            fontSize: AppConstants.FONT_SIZE,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      onTap: () {
                        LogUtil.v("点击了生日");
                        DatePicker.showDatePicker(
                            context,
                            onMonthChangeStartWithFirstDate: true,
                            pickerTheme: DateTimePickerTheme(
                                showTitle: _showTitle,
                                confirm: Text('custom Done', style: TextStyle(color: Colors.red))
                            ),
                            minDateTime: DateTime.parse(MIN_DATETIME),
                            maxDateTime: DateTime.parse(MAX_DATETIME),
                            initialDateTime: _dateTime,
                            dateFormat: _format,
                            locale: _locale
                          // return DatePicker.showDatePicker({
                          //     context,
                          //     DATETIME_PICKER_LOCALE_DEFAULT,
                          //     DateTimePickerMode.date
                          // });
                        );
                      }
                  )
              ),

              Card(
                  color: Colors.white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  clipBehavior: Clip.antiAlias,
                  semanticContainer: false,
                  child: ListTile(
                      leading: Icon(FontAwesomeIcons.genderless, color: Colors.black),
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text(
                        "性别",
                        style: TextStyle(
                            fontSize: AppConstants.FONT_SIZE,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      onTap: () {
                        LogUtil.v("点击了性别");
                      }
                  )
              ),

              Card(
                  color: Colors.white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  clipBehavior: Clip.antiAlias,
                  semanticContainer: false,
                  child: ListTile(
                      leading: Icon(FontAwesomeIcons.mobile, color: Colors.black),
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text(
                        "电话",
                        style: TextStyle(
                            fontSize: AppConstants.FONT_SIZE,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      onTap: () {
                        LogUtil.v("点击了手机号码");
                      }
                  )
              ),

              GestureDetector(
                onTap: (){
                  LogUtil.v("点击继续");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeRoute();
                  }));
                },
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                        borderRadius: BorderRadius.circular(3.0),
                        boxShadow: [ //阴影
                          BoxShadow(
                              color:Colors.black54,
                              offset: Offset(2.0,2.0),
                              blurRadius: 4.0
                          )
                        ]
                    ),
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                        child: Text("继续", style: TextStyle(color: Colors.white),)
                    )
                )
              )
            ]
          )
        )
      )
    );
  }
}