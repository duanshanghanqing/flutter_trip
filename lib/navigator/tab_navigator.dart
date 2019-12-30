import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/HomePage/index.dart'; // 导入页面
import 'package:flutter_trip/pages/SearchPage/index.dart';
import 'package:flutter_trip/pages/TravelPage/index.dart';
import 'package:flutter_trip/pages/MyPage/index.dart';

class TabNavigator extends StatefulWidget {

  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

// https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
class _TabNavigatorState extends State<TabNavigator> {
  // 定义页面 PageView 构造函数
  final _controller = PageController(
    // 初始化显示第一个页面
    initialPage: 0,
  );
  // 定义默认颜色
  final _defaultColor = Colors.grey;
  // 定义激活颜色
  final _activeColor = Colors.blue;
  // 定义切换页面索引值
  int _currentIndex = 0;

  // 切换界面
  void _switchTab(index) {
    _controller.jumpToPage(index);
    // print(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          // 存放页面
          HomePage(switchTab: _switchTab),
          SearchPage(switchTab: _switchTab),
          TravelPage(switchTab: _switchTab),
          MyPage(switchTab: _switchTab),
        ],
      ),
      // 底部按钮
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _switchTab(index);
        },
        type: BottomNavigationBarType.fixed, // 不带缩放动画
        // type: BottomNavigationBarType.shifting, // 带缩放动画，默认
        // fixedColor: Color.fromRGBO(255, 255, 255, 0.5), // 底部导航栏type为fixed时导航栏的颜色，如果为空的话默认使用ThemeData.primaryColor
        iconSize: 24, // BottomNavigationBarItem icon的大小
        unselectedFontSize: 14, // 默认字体大小
        selectedFontSize: 14, // 选中字体大小
        // unselectedItemColor: Colors.grey, // 默认item颜色
        // selectedItemColor: Colors.white, // 选中 item 颜色
        backgroundColor: Colors.white, // 背景颜色
        items: [
          BottomNavigationBarItem(
            // 默认icon
            icon: Icon(
              Icons.home,
              color: _defaultColor,
            ),
            // 激活icon
            activeIcon: Icon(
              Icons.home,
              color: _activeColor,
            ),
            // title: new Container(), // 设置一个空的Text
            title: Text(
              '首页',
              style: TextStyle(
                  // fontSize: _currentIndex == 0 ? 15 : 18,
                  color: _currentIndex == 0 ? _activeColor : _defaultColor),
            ),
          ),
          BottomNavigationBarItem(
            // 默认icon
            icon: Icon(
              Icons.search,
              color: _defaultColor,
            ),
            // 激活icon
            activeIcon: Icon(
              Icons.search,
              color: _activeColor,
            ),
            title: Text(
              '搜索',
              style: TextStyle(
                  // fontSize: _currentIndex == 1 ? 15 : 18,
                  color: _currentIndex == 1 ? _activeColor : _defaultColor),
            ),
          ),
          BottomNavigationBarItem(
            // 默认icon
            icon: Icon(
              Icons.camera_alt,
              color: _defaultColor,
            ),
            // 激活icon
            activeIcon: Icon(
              Icons.camera_alt,
              color: _activeColor,
            ),
            title: Text(
              '旅拍',
              style: TextStyle(
                  // fontSize: _currentIndex == 2 ? 15 : 18,
                  color: _currentIndex == 2 ? _activeColor : _defaultColor),
            ),
          ),
          BottomNavigationBarItem(
            // 默认icon
            icon: Icon(
              Icons.account_circle,
              color: _defaultColor,
            ),
            // 激活icon
            activeIcon: Icon(
              Icons.account_circle,
              color: _activeColor,
            ),
            title: Text(
              '我的',
              style: TextStyle(
                  // fontSize: _currentIndex == 3 ? 15 : 18,
                  color: _currentIndex == 3 ? _activeColor : _defaultColor),
            ),
          ),
        ],
      ),
    );
  }
}
