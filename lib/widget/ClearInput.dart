//import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//class ClearInput extends StatelessWidget {
//  String text3 = '';
//  TextEditingController mControll3 = TextEditingController();
//
//  @override
//  void dispose() {
//    mControll3.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Padding(
//      padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
//      child: Container(
//        width: ScreenUtil.getInstance().setWidth(670),
//        height: ScreenUtil.getInstance().setWidth(90),
//        decoration: BoxDecoration(
//          border: Border.all(width: 0.5, color: Color(0xffd4e0ef)),
//          borderRadius: BorderRadius.circular(10),
//        ),
//        child: Row(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Container(
//              width: ScreenUtil.getInstance().setWidth(90),
//              height: ScreenUtil.getInstance().setWidth(90),
//              alignment: Alignment.center,
//              child: SizedBox(
//                width: ScreenUtil.getInstance().setWidth(45),
//                height: ScreenUtil.getInstance().setHeight(45),
//                child: Image.asset('images/grey_bankcard.png'),
//              ),
//            ),
//            Expanded(
//                child: TextField(
//              controller: mControll3,
//              style: TextStyle(fontSize: ScreenUtil.textScaleFactor),
//              onChanged: (value) {
//                setState(() {
//                  text3 = value;
//                });
//              },
//              inputFormatters: [
//                WhitelistingTextInputFormatter(RegExp("[0-9]")),
//                LengthLimitingTextInputFormatter(16),
//              ],
//              decoration: InputDecoration(
//                hintText: 'bank num :',
//                border: InputBorder.none,
//                hintStyle:
//                    TextStyle(fontSize: ScreenUtil.getInstance().setSp(22)),
//              ),
//            )),
//            Offstage(
//              offstage: text3.isEmpty ? true : false,
//              child: GestureDetector(
//                onTap: () {
//                  setState(() {
//                    text3 = '';
//                    mControll3.clear(); //清除textfield的值
//                  });
//                },
//                child: Container(
//                  width: 45,
//                  height: 45,
//                  child: Icon(
//                    Icons.cancel,
//                    color: Colors.grey,
//                    size: 17,
//                  ),
//                ),
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
