import 'package:flutter/material.dart';
import 'package:flutter_trip/model/sales_box_model.dart';
import 'package:flutter_trip/widget/WebView/index.dart';

class SalesBox extends StatelessWidget {
  final SalesBoxModel salesBox;

  const SalesBox({Key key, @required this.salesBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (salesBox == null) {
      return Text('加载中。。。。');
    }

    // 设置box容器
    return ClipRRect(
      // 设置圆角
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // 填充
      child: Column(
        children: <Widget>[
          // 广告标题
          Container(
            decoration: BoxDecoration(
              // 边色与边宽度
              border: Border.all(color: Color(0xfff2f2f2), width: 1),
              // 颜色
              color: Colors.white,
            ),
            child: Padding(
              // 填充值
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, //子组件的排列方式为主轴两端对齐
                children: <Widget>[
                  Container(
                    // width: 200,
                    child: Row(
                      children: <Widget>[
                        Image.network(
                          salesBox.icon,
                          // width: 100,
                          height: 25,
                        ),
                        Container(
                          child: Image.network(
                            'http://pic.c-ctrip.com/platform/h5/home/icon-gg@2x.png',
                            // width: 100,
                            height: 25,
                          ),
                          // margin: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(left: 10),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebView(
                            url: salesBox.moreUrl,
                            // statusBarColor: gridNavItem.mainItem.statusBarColor,
                            // hideAppBar: true,
                            title: '更多',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      // padding: EdgeInsets.all(7),
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 5,
                        top: 2,
                        bottom: 4,
                      ),
                      // 设置装饰器
                      decoration: BoxDecoration(
                        // 圆角
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        // 设置背景渐变
                        gradient: LinearGradient(
                          // 渐变开始颜色，渐变结束颜色
                          colors: [
                            Color(int.parse('0xffff4e63')), // 0xff + ff4e63
                            Color(int.parse('0xffff6cc9')),
                          ],
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '获取更多福利',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 22.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 活动1
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // 边色与边宽度
                    // border: Border.all(color: Color(0xfff2f2f2), width: 0.5),
                    // 设置指定边框样式
                    border: Border(
                      right: BorderSide(
                        // 设置边框宽度
                        width: 1,
                        // 设置边框颜色
                        color: Color(0xfff2f2f2),
                      ),
                      // 底部边框
                      bottom: BorderSide(
                        // 设置边框宽度
                        width: 1,
                        // 设置边框颜色
                        color: Color(0xfff2f2f2),
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebView(
                            url: salesBox.bigCard1.url,
                            // statusBarColor: gridNavItem.mainItem.statusBarColor,
                            // hideAppBar: true,
                            title: salesBox.bigCard1.title,
                          ),
                        ),
                      );
                    },
                    child: Image.network(
                      salesBox.bigCard1.icon,
                      // width: 100,
                      // height: 25,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // 设置指定边框样式
                    border: Border(
                      // 底部边框
                      bottom: BorderSide(
                        // 设置边框宽度
                        width: 1,
                        // 设置边框颜色
                        color: Color(0xfff2f2f2),
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebView(
                            url: salesBox.bigCard2.url,
                            // statusBarColor: gridNavItem.mainItem.statusBarColor,
                            // hideAppBar: true,
                            title: salesBox.bigCard2.title,
                          ),
                        ),
                      );
                    },
                    child: Image.network(
                      salesBox.bigCard2.icon,
                      // width: 100,
                      // height: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // 活动2
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // 边色与边宽度
                    // border: Border.all(color: Color(0xfff2f2f2), width: 0.5),
                    // 设置指定边框样式
                    border: Border(
                      right: BorderSide(
                        // 设置边框宽度
                        width: 1,
                        // 设置边框颜色
                        color: Color(0xfff2f2f2),
                      ),
                      // 底部边框
                      bottom: BorderSide(
                        // 设置边框宽度
                        width: 1,
                        // 设置边框颜色
                        color: Color(0xfff2f2f2),
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebView(
                            url: salesBox.smallCard1.url,
                            // statusBarColor: gridNavItem.mainItem.statusBarColor,
                            // hideAppBar: true,
                            title: salesBox.smallCard1.title,
                          ),
                        ),
                      );
                    },
                    child: Image.network(
                      salesBox.smallCard1.icon,
                      // width: 100,
                      // height: 25,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // 设置指定边框样式
                    border: Border(
                      // 底部边框
                      bottom: BorderSide(
                        // 设置边框宽度
                        width: 1,
                        // 设置边框颜色
                        color: Color(0xfff2f2f2),
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebView(
                            url: salesBox.smallCard2.url,
                            // statusBarColor: gridNavItem.mainItem.statusBarColor,
                            // hideAppBar: true,
                            title: salesBox.smallCard2.title,
                          ),
                        ),
                      );
                    },
                    child: Image.network(
                      salesBox.smallCard2.icon,
                      // width: 100,
                      // height: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // 活动3
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // 边色与边宽度
                    // border: Border.all(color: Color(0xfff2f2f2), width: 0.5),
                    // 设置指定边框样式
                    border: Border(
                      right: BorderSide(
                        // 设置边框宽度
                        width: 1,
                        // 设置边框颜色
                        color: Color(0xfff2f2f2),
                      ),
                      // 底部边框
                      bottom: BorderSide(
                        // 设置边框宽度
                        width: 1,
                        // 设置边框颜色
                        color: Color(0xfff2f2f2),
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebView(
                            url: salesBox.smallCard3.url,
                            // statusBarColor: gridNavItem.mainItem.statusBarColor,
                            // hideAppBar: true,
                            title: salesBox.smallCard3.title,
                          ),
                        ),
                      );
                    },
                    child: Image.network(
                      salesBox.smallCard3.icon,
                      // width: 100,
                      // height: 25,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // 设置指定边框样式
                    border: Border(
                      // 底部边框
                      bottom: BorderSide(
                        // 设置边框宽度
                        width: 1,
                        // 设置边框颜色
                        color: Color(0xfff2f2f2),
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebView(
                            url: salesBox.smallCard4.url,
                            // statusBarColor: gridNavItem.mainItem.statusBarColor,
                            // hideAppBar: true,
                            title: salesBox.smallCard4.title,
                          ),
                        ),
                      );
                    },
                    child: Image.network(
                      salesBox.smallCard4.icon,
                      // width: 100,
                      // height: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
