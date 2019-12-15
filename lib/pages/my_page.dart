import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        // 设置圆角
        borderRadius: BorderRadius.all(Radius.circular(15)),
        // Column(): 垂直布局
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _oneItem(context, 1.0),
            _item(context, 1.0),
            _item(context, 0),
          ],
        ),
      ),
    );
  }

  Widget _oneItem(BuildContext context, double bottomWidth) {
    return Container(
      // double.infinity ： 撑满
      width: double.infinity,
      height: 60,
      // 设置装饰器
      decoration: BoxDecoration(
        // 边色与边宽度
        // border: Border.all(color: Color(0xFFFF0000), width: 0.5),
        // 设置指定边框样式
        border: Border(
          bottom: BorderSide(
            // 设置边框宽度
            width: bottomWidth,
            // 设置边框颜色
            color: Colors.red,
          ),
        ),
        // 设置背景渐变
        gradient: LinearGradient(
          // 渐变开始颜色，渐变结束颜色
          colors: [Colors.amberAccent, Colors.lightBlue],
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
              child: Text('1'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
              child: Text('2'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, double bottomWidth) {
    return Container(
      // double.infinity ： 撑满
      width: double.infinity,
      height: 60,
      // 设置装饰器
      decoration: BoxDecoration(
        // 边色与边宽度
        // border: Border.all(color: Color(0xFFFF0000), width: 0.5),
        // 设置指定边框样式
        border: Border(
          bottom: BorderSide(
            // 设置边框宽度
            width: bottomWidth,
            // 设置边框颜色
            color: Colors.red,
          ),
        ),
        // 设置背景渐变
        gradient: LinearGradient(
          // 渐变开始颜色，渐变结束颜色
          colors: [Colors.amberAccent, Colors.lightBlue],
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
              child: Text('1'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
              child: Text('2'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 0,
                    color: Colors.blue,
                  ),
                ),
              ),
              child: Text('3'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
