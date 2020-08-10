import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liveshop/common/AppConstants.dart';
import 'package:liveshop/view/CaretRoute.dart';
import 'package:liveshop/view/EditInfoRoute.dart';
import 'package:liveshop/view/LiveRoute.dart';
import 'package:liveshop/view/MsgRoute.dart';
import 'package:liveshop/view/LobbyRoute.dart';
import 'package:liveshop/util/LogUtil.dart';
import 'package:liveshop/widget/ListOptionsItem.dart';
import 'package:liveshop/widget/OASwiper.dart';
import 'package:liveshop/widget/RoundFormField.dart';
import 'package:liveshop/widget/SearchBar.dart';
import 'package:liveshop/widget/SkuHomeList.dart';
import 'package:liveshop/util/EventBus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 首页模块
class HomeRoute extends StatefulWidget {

  String userInfo;

  HomeRoute({userInfo});

  @override
  _HomeRouteState createState({userInfo}) => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute>
    with SingleTickerProviderStateMixin {
  //当前选中的导航
  int _selectedIndex = 0;

  TabController _tabController;

  List tabs = ['最新', '热门', '精选'];

  List<Widget> mainMenu = [
    HomeMenuGridView(),
    LiveLobby(0),
    LobbyRoute(),
    MsgRoute(),
    CaretRoute()
  ];

  var bus = EventBus();

  File _image;

  String userInfo;

  @override
  Widget build(BuildContext context) {
    EasyLoading.dismiss();
//    EasyLoading.dismiss();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Flex(direction: Axis.horizontal, children: <Widget>[
          Expanded(
            child: RoundFormField(),
            flex: 5,
          ),
          Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: searchBarDelegate());
              }))
        ])),
        leading: Builder(builder: (context) {
          return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              });
        }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () async {
            _openCamera();
          })
        ],
        bottom: this._selectedIndex == 1
            ? TabBar(
                controller: _tabController,
                tabs: tabs.map((e) => Tab(text: e)).toList())
            : null,
      ),

      drawer: MyDrawer(userInfo),
      body: Container(
        child: this._selectedIndex != 1
            ? mainMenu[_selectedIndex]
            : LiveList(this._tabController.index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 14.0,
        unselectedFontSize: 14.0,
        selectedFontSize: 14.0,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "首页",
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.videocam),
              title: Text(
                "直播",
              )),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("广场")),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text(
                "消息",
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Text("购物车")),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      // 浮动按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _onAdd,
        child: Icon(Icons.add),
      ),
    );
  }

  Future _openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    _image = image;
    LogUtil.v(_image.path, tag: "主页");
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}

  @override
  void dispose() {
    super.dispose();
    bus.off("tab");
  }

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 1:
          bus.send("tab", 1);
          break;
        case 2:
          break;
        case 3:
          break;
        default:
      }
    });

  }
}

class HomeMenuGridView extends StatefulWidget {
  @override
  _HomeMenuGridViewState createState() => _HomeMenuGridViewState();
}

class _HomeMenuGridViewState extends State<HomeMenuGridView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: <Widget>[
          Container(
            height: 150.0,
            child: SwiperPage(title: "热点新闻"),
          ),
          Container(
              color: Colors.white,
              child: Flex(direction: Axis.horizontal, children: <Widget>[
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.mobile_screen_share, color: Colors.red),
                          Text("充值中心")
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.fastfood, color: Colors.green),
                          Text("美食")
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.card_travel, color: Colors.blue),
                          Text("旅行"),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.mic, color: Colors.lightBlue),
                          Text("娱乐"),
                        ],
                      ),
                    ))
              ])),
          Container(
              color: Colors.white,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.videogame_asset, color: Colors.yellow),
                            Text("游戏"),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.accessibility, color: Colors.blue),
                            Text("生活"),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.local_hospital, color: Colors.green),
                            Text("健康"),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.school, color: Colors.red),
                            Text("学习"),
                          ],
                        ),
                      )),
                ],
              )),
          Container(child: SkuHomeList())
        ]));
  }
}

/// 侧边滑动栏
class MyDrawer extends StatefulWidget {

  @override
  _MyDrawerState createState() => _MyDrawerState();

  MyDrawer(String userInfo, {
    Key key
  }) : super(key: key);
}

class _MyDrawerState extends State<MyDrawer> {

  String avatar = AppConstants.NATIVE_IMAGE_PATH + "me.jpg";

  String nickname = "杨小前";

  String userInfo;


  @override
  void initState() {
    _getInfo();
  }

  void _getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userInfo = prefs.getString("userInfo");
    Map data = jsonDecode(userInfo);
    Map user = data['user'];
    setState(() {
      this.avatar = user['avatar'];
      this.nickname = user['nickName'];
      LogUtil.v(nickname);
    });
  }

  @override
  Widget build(BuildContext context) {
//    _getInfo();
    // TODO: implement build
    return Drawer(
        child: MediaQuery.removePadding(
            context: context,
            child: ListView(children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(color: Colors.lightBlueAccent),
                  child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (
                                    context) {
                                  return EditInfoRoute();
                                }));
                              },
                              child: Column(
                                children: <Widget>[
                                  ClipOval(
                                    child: Image.network(avatar, width: 80),
//                                  child: Image.asset(AppConstants.NATIVE_IMAGE_PATH + "me.jpg", width: 80)
                                  ),
//                                Text("杨小前")
                                  Text(nickname)
                                ],
                              )
                          )
                      )
                  )
              ),
              ListOptionItem(Icons.settings, "设置", () {
                LogUtil.v("点击了头像");
              }),
              ListOptionItem(Icons.info, "信息", () {
                LogUtil.v("点击了头像");
              }),
              ListOptionItem(Icons.local_laundry_service, "服务", () {
                LogUtil.v("点击了头像");
              }),
              ListOptionItem(Icons.collections, "收藏", () {
                LogUtil.v("点击了头像");
              })
            ])
        )
    );
  }
}