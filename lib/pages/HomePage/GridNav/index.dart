import 'package:flutter/material.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';
import 'package:flutter_trip/widget/WebView/index.dart';

// 创建组件
class GridNav extends StatelessWidget {
  // 属性
  final GridNavModel gridNav;
  final String name;

  // 构造方法
  // @required :注解表示参数是必传的
  // his.name='张三' ：给属性添加默认值
  GridNav({Key key, @required this.gridNav, this.name = '张三'}) : super(key: key);

  // 重写build方法
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      // _oneItem(context, 1.0),
      // _item(context, 1.0),
      // _item(context, 0),
    ];

    if (gridNav?.hotel != null) {
      list.add(_item(context, 1.0, gridNav.hotel));
    }
    if (gridNav?.flight != null) {
      list.add(_item(context, 1.0, gridNav.flight));
    }
    if (gridNav?.travel != null) {
      list.add(_item(context, 0.0, gridNav.travel));
    }

    // ClipRRect(), ：裁剪，溢出隐藏
    return ClipRRect(
      // 设置圆角
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // Column(): 垂直布局
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: list,
      ),
    );
  }

  Widget _item(
      BuildContext context, double bottomWidth, GridNavItem gridNavItem) {
        // 大盒子
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
          // 底部边框
          bottom: BorderSide(
            // 设置边框宽度
            width: bottomWidth,
            // 设置边框颜色
            color: Colors.white,
          ),
        ),
        // 设置背景渐变
        gradient: LinearGradient(
          // 渐变开始颜色，渐变结束颜色
          colors: [
            Color(int.parse('0xff' + gridNavItem.startColor)),
            Color(int.parse('0xff' + gridNavItem.endColor)),
          ],
        ),
      ),
      // Row + flex 布局
      child: Row(
        children: <Widget>[
          // 弹性盒子
          Expanded(
            flex: 1,
            // GestureDetector() :添加绑定事件
            child: GestureDetector(
              onTap: () {
                print(gridNavItem.mainItem.url);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebView(
                      url: gridNavItem.mainItem.url,
                      statusBarColor: gridNavItem.mainItem.statusBarColor,
                      hideAppBar: true,
                      title: gridNavItem.mainItem.title,
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  // 背景图片
                  // image: DecorationImage(
                  //   image: NetworkImage(gridNavItem.mainItem.icon),
                  //   fit: BoxFit.scaleDown,
                  // ),
                  border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Stack(), 重叠
                child: Stack(
                  // alignment: FractionalOffset(0.5, 0.95),
                  // alignment 对齐方式 0~1
                  children: <Widget>[
                    // Positioned() 偏移
                    Positioned(
                      top: 10.0,
                      left: 35.0,
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(gridNavItem.mainItem.icon),
                            fit: BoxFit.scaleDown,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 17.0,
                      left: 8.0,
                      child: Text(
                        gridNavItem.mainItem.title,
                        style: TextStyle(
                          // color: Color.fromARGB(255, 150, 150, 150),
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                print(gridNavItem.item1.url);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebView(
                      url: gridNavItem.item1.url,
                      statusBarColor: gridNavItem.item1.statusBarColor,
                      hideAppBar: true,
                      title: gridNavItem.item1.title,
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Text(
                  gridNavItem.item1.title,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    // color: Color.fromARGB(255, 150, 150, 150),
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                alignment: FractionalOffset.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                print(gridNavItem.item2.url);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebView(
                      url: gridNavItem.item2.url,
                      statusBarColor: gridNavItem.item2.statusBarColor,
                      hideAppBar: true,
                      title: gridNavItem.item2.title,
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Text(
                  gridNavItem.item2.title,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    // color: Color.fromARGB(255, 150, 150, 150),
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                alignment: FractionalOffset.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                print(gridNavItem.item3.url);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebView(
                      url: gridNavItem.item3.url,
                      statusBarColor: gridNavItem.item3.statusBarColor,
                      hideAppBar: true,
                      title: gridNavItem.item3.title,
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Text(
                  gridNavItem.item3.title,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    // color: Color.fromARGB(255, 150, 150, 150),
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                alignment: FractionalOffset.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
