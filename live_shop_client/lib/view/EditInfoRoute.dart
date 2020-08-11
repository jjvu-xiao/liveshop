
import 'dart:convert';
import 'dart:io';

import 'package:city_pickers/city_pickers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:liveshop/common/AppConstants.dart';
import 'package:liveshop/route/NavigatorUtil.dart';
import 'package:liveshop/util/LiveShopUtil.dart';
import 'package:liveshop/view/HomeRoute.dart';
import 'package:liveshop/util/HttpUtil.dart';
import 'package:liveshop/util/LogUtil.dart';
import 'package:liveshop/widget/CommonBottomSheet.dart';

/// 用户编辑信息界面
class EditInfoRoute extends StatefulWidget {

  String loginname;

  String method;

  EditInfoRoute({this.loginname, this.method});

  @override
  _EditInfoRouteState createState() => _EditInfoRouteState();

}

class _EditInfoRouteState extends State<EditInfoRoute> {

  String _MIN_DATETIME;

  String _MAX_DATETIME;

  String _INIT_DATETIME;

  bool _showTitle = true;

  DateTimePickerLocale _locale = DateTimePickerLocale.zh_cn;

  List<DateTimePickerLocale> _locales = DateTimePickerLocale.values;

  String _format = 'yyyy-MM-dd';

  DateTime _dateTime;

  // 选择的头像图片
  File _image;

  // 昵称
  TextEditingController _nicknameController = TextEditingController();

  // 生日
  TextEditingController _birthdayController = TextEditingController();

  // 手机号
  TextEditingController _mobileController = TextEditingController();

  // 所在城市
  TextEditingController _locationController = TextEditingController();

  Result _locationCity = null;

  // 个性签名
  TextEditingController _signatureController = TextEditingController();

  // 默认的头像（缓存在本地的图片）
  String _imagePath = AppConstants.NATIVE_IMAGE_PATH + "me.jpg";

  // 密码
  TextEditingController _passwordController = TextEditingController();

  // 确认密码
  TextEditingController _passwordController1 = TextEditingController();

  String _loginname = "";

  // 性别，默认为男
  int _sex = 1;

  // 当前日期
  DateTime now;

  var _formatter = DateFormat('yyyy-MM-dd');

  String _birth = "2019-11-15";

  bool active = false;

  int activedIndex = 0;

  Result resultArr = new Result();

//  FocusNode _focusNode = FocusNode();

  /// 获取当前的日期并格式化'yyyy-MM-dd'的格式
  /// 设置日期选择控件的最小日期，最大日期，默认选中日期，其中最大日期，默认选中日期为今天
  @override
  void initState() {
    _MIN_DATETIME =  '2010-05-12';
    now = DateTime.now();
    _MAX_DATETIME = _formatter.format(now);
    _INIT_DATETIME = _MAX_DATETIME;
//    _focusNode.addListener(() {
//      if (_focusNode.hasFocus) {//有焦点
//        active = true;
//      }
//      else{ //失去焦点
//        active = false;
//        _nickname = _nicknameController.text.trim();
//      }
//    });
  }

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      LogUtil.v(_image.path);
    });
  }

  Future selectImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        _imagePath = _image.path;
        LogUtil.v(_image.path);

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
          color: Color.fromARGB(245,245,245,245)
          ),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          ClipOval (
                            child: Container(
                              height: 150,
                              width: 150,
                              color: Colors.white,
                              child: Image.asset(_imagePath, width: 150)
                            )
                          ),
                        ],
                      ),
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
                                      await selectImage();
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
                  child: Flex(
                    direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Icon(Icons.person, color: Colors.black)
                        ),
                        Expanded(
                          flex: 9,
                          child: ListTile(
                            leading: Text("昵称："),
                            trailing: Icon(Icons.arrow_forward_ios),
                            title: TextField(
                              controller: _nicknameController
                            ),
                            onTap: () {
                              setState(() {
                                activedIndex = 1;
                              });
                              LogUtil.v("点击了昵称");
                            }
                          )
                        )
                      ]
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
                  child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Icon(FontAwesomeIcons.passport, color: Colors.black),
                        ),
                        Expanded(
                            flex: 9,
                            child: ListTile(
                                leading: Text("密码："),
                                trailing: Icon(Icons.arrow_forward_ios),
                                title: TextField(
                                  controller: _passwordController,
                                ),
                                onTap: () {
                                  LogUtil.v("点击了密码");
                                })
                        )
                      ]
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
                  child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Icon(FontAwesomeIcons.passport, color: Colors.black),
                        ),
                        Expanded(
                            flex: 9,
                            child: ListTile(
                                leading: Text("确认密码："),
                                trailing: Icon(Icons.arrow_forward_ios),
                                title: TextField(
                                  controller: _passwordController1,
                                ),
                                onTap: () {
                                  LogUtil.v("点击了确认密码");
                                })
                        )
                      ]
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
                  child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Icon(FontAwesomeIcons.birthdayCake, color: Colors.black)
                        ),
                        Expanded(
                          flex: 9,
                          child: ListTile(
                              leading: Text("生日："),
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
                                DatePicker.showDatePicker(
                                    context,
                                    onMonthChangeStartWithFirstDate: true,
                                    pickerTheme: DateTimePickerTheme(
                                        showTitle: _showTitle,
                                        confirm: Text('确定', style: TextStyle(color: Colors.red))
                                    ),
                                    minDateTime: DateTime.parse(_MIN_DATETIME),
                                    maxDateTime: DateTime.parse(_MAX_DATETIME),
                                    initialDateTime: DateTime.parse(_INIT_DATETIME),
                                    dateFormat: _format,
                                    locale: _locale,
                                    onChange: (DateTime dateTime, List<int> selectedIndex) {
                                      LogUtil.v("改变的日期$dateTime\t$selectedIndex");
                                    },
                                    onConfirm: (DateTime dateTime, List<int> selectedIndex) {
                                      String selectedBirth = _formatter.format(dateTime);
                                      setState(() {
                                        _birth = selectedBirth;
                                        _birthdayController.text = selectedBirth;
                                      });
                                      LogUtil.v("选中的日期$selectedBirth");
                                    }
                                );
                              }
                          )
                        )
                      ]
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
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child:  Icon(FontAwesomeIcons.genderless, color: Colors.black)
                      ),
                      Expanded(
                          flex: 9,
                          child:  ListTile(
                              leading: Text("性别"),
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
                      )
                    ],
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
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Icon(FontAwesomeIcons.mobile, color: Colors.black),
                      ),
                      Expanded(
                       flex: 9,
                       child: ListTile(
                         leading: Text("电话"),
                         trailing: Icon(Icons.arrow_forward_ios),
                         title: TextField(
                           controller: _mobileController,
                         ),
                         onTap: () {
                           LogUtil.v("点击了手机号码");
                         })
                      )
                    ]
                  )
              ),

              Card(
                  color: Colors.white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Icon(FontAwesomeIcons.city, color: Colors.black)
                        ),
                        Expanded(
                            flex: 9,
                            child: ListTile(
                                leading: Text("所在城市："),
                                trailing: Icon(Icons.arrow_forward_ios),
                                title: TextField(
                                  controller: _locationController,
                                ),
                                onTap: () {
                                  LogUtil.v("点击了所在城市");
                                  _selectCity();
                                }
                            )
                        )
                      ]
                  )
              ),

              Card(
                color: Colors.white,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.signature),
                      Text(
                        "个性签名",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold
                        )
                      )
                    ]
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          maxLines: 6,
                          controller: _signatureController,
                        )
                      ]
                    )
                  )
              ),

              GestureDetector(
                onTap: (){
                  LogUtil.v("点击继续");
                  submitProfile();
//                  Navigator.push(context, MaterialPageRoute(builder: (context) {
//                    return HomeRoute();
//                  }));
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
//    _focusNode.dispose();
  }

  void submitProfile() async {
    EasyLoading.show(status: "加载中");
    var nickname = _nicknameController.text.trim();
    var birth = _birth;
    var sex = _sex == 0 ?  true : false;
    var mobile = _mobileController.text.trim();
    var signature = _signatureController.text.trim();
    String passwd = _passwordController.text.trim();
    String passwd1 = _passwordController1.text.trim();
    String locationCity =  _locationController.text.trim();
    if (passwd != passwd1) {
      EasyLoading.dismiss();
      EasyLoading.showToast("密码跟确认密码必须一致");
      return;
    }

    FormData formData = FormData.from({"nickname" : nickname, "birth" : birth, "sex" : sex, "mobile" : mobile,
      "avator": UploadFileInfo(_image, "avator.jpg"), "signature" : signature, "passwd" : passwd, "loginame": widget.loginname,
      "createBy": widget.method, "lastUpdateBy": widget.method, "email": widget.loginname, "loginname": widget.loginname,
      'locationCity': locationCity
    });
    String callback = await HttpUtil.post(url: AppConstants.BASE_URL + "/customer/profile",
        data:formData);
    Map data = jsonDecode(callback);
    LogUtil.v(data['msg']);
    if (data['code'] == 200) {
      EasyLoading.showSuccess(data['msg']);
    }
    else {
      EasyLoading.showError(data['msg']);
      return;
    }
    await Future.delayed(Duration(seconds: 1), () {
      EasyLoading.dismiss();
      NavigatorUtil.jump(context, '/index');
//      Navigator.push(context, MaterialPageRoute(builder: (context) {
//        return HomeRoute();
//      }));
    });
  }

  /// 选择城市
  void _selectCity() async{
//    Result result = await CityPickers.showCityPicker(
//      context: context,
//    );

//    Result result2 = await CityPickers.showFullPageCityPicker(
//      context: context,
//    );
//    Result result2 = await CityPickers.showCitiesSelector(
//      context: context,
//    );
    Result tempResult = await CityPickers.showCityPicker(
        context: context,
        theme: Theme.of(context).copyWith(primaryColor: Color(0xfffe1314)), // 设置主题
        locationCode: resultArr != null ? resultArr.areaId ?? resultArr.cityId ?? resultArr.provinceId : null, // 初始化地址信息
        cancelWidget: Text(
          '取消',
        ),
        confirmWidget: Text(
          '确定',
        ),
        height: 220.0
    );
    if(tempResult != null){
      setState(() {
        LogUtil.v(tempResult.toString(), tag: "选择城市");
        _locationCity = tempResult;
        _locationController.text = LiveShopStringUtil.formatCity(tempResult.toString());
      });
    }
  }

}