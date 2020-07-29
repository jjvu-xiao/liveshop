
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:liveshop/common/AppConstants.dart';
import 'package:liveshop/route/HomeRoute.dart';
import 'package:liveshop/util/LogUtil.dart';
import 'package:liveshop/widget/CommonBottomSheet.dart';

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

  // 选择的头像图片
  File _image;

  // 昵称
  TextEditingController _nicknameController = new TextEditingController();

  // 默认的头像（缓存在本地的图片）
  String _imagePath = AppConstants.NATIVE_IMAGE_PATH + "me.jpg";

  // 昵称
  String _nickname = "杨小前";

  // 性别，默认为男
  int _sex = 1;

  // 生日
  DateTime _birthday = DateTime.now();

  var formatter = DateFormat('yyyy-MM-dd');

  String _birth = "2019-11-15";

  bool active = false;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {//有焦点
        active = true;
      }
      else{ //失去焦点
        active = false;
        _nickname = _nicknameController.text.trim();
      }
    });
  }

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      LogUtil.v(_image.lengthSync());
    });
  }

  Future selectImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        LogUtil.v(_image.lengthSync());
        _imagePath = _image.path;
      });
  }

  @override
  Widget build(BuildContext context) {
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
              Column(
                children: <Widget>[
                  InkWell(
                    child: ClipOval (
                      child: Container(
                        height: 150,
                        width: 150,
                        color: Colors.white,
          //                      child: Icon(FontAwesomeIcons.camera),
                        child: Image.asset(_imagePath, width: 150),
                      )
                    ),
                    onTap: (){
                      LogUtil.v("点击了头像");
                      showDialog(
                          barrierDismissible: true,//是否点击空白区域关闭对话框,默认为true，可以关闭
                          context: context,
                          builder: (BuildContext context) {
                            var list = List();
                            list.add('拍照');
                            list.add('选择相册');
                            return CommonBottomSheet(
                                list: list,
                                onItemClickListener: (index) async {
                                  LogUtil.v(index);
                                  switch (index) {
                                    case 1:
                                      openCamera();
                                      break;
                                    case 2:
                                      selectImage();
                                      Navigator.pop(context);
                                      break;
                                    default:
                                      Navigator.pop(context);
                                  }
                                }
                            );
                          }
                      );
                    }
                  )
//                  Text("杨小前")
                ]
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
                      leading: Icon(Icons.person, color: Colors.black),
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: active ?
                      TextField(
                        focusNode: _focusNode
                      ) :
                      Text(
                        _nickname,
                        style: TextStyle(
                            fontSize: AppConstants.FONT_SIZE,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          active = true;
                        });
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
                        _birth,
                        style: TextStyle(
                            fontSize: AppConstants.FONT_SIZE,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      onTap: () async {
                        LogUtil.v("点击了生日");
                        var birth = await DatePicker.showDatePicker(
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
                        );
//                        print(birth);
//                        setState(() {
//                          _datetime=date;
//                        });
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
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("男："),
                          Radio(
                            value: 1,
                            groupValue: this._sex,
                            onChanged: (value) {
                              setState(() {
                                this._sex = value;
                              });
                            },
                          ),
                          SizedBox(width: 20),
                          Text("女："),
                          Radio(
                            value: 2,
                            groupValue: this._sex,
                            onChanged: (value) {
                              setState(() {
                                this._sex = value;
                              });
                            },
                          )
                        ],
                      )
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

  //页面销毁
  @override
  void dispose() {
    super.dispose();
    //释放
    _focusNode.dispose();
  }
}