import 'package:flutter/material.dart';
import 'package:flutter_trip/model/sales_box_model.dart';

class SalesBox extends StatelessWidget {
  final SalesBoxModel salesBox;

  const SalesBox({Key key, @required this.salesBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (salesBox == null) {
      return null;
    }

    // 设置box容器
    return Container(
      // height: 85,
      // 样式修饰器
      decoration: BoxDecoration(
        // 颜色
        color: Colors.white,
        // 圆角
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      // 填充
      child: Padding(
        // 填充值
        padding: EdgeInsets.all(7),
        child: Column(
          children: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Text('123')
            //   ],
            // ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                // 颜色
                color: Colors.white,
              ),
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
                          height: 20,
                        ),
                        Container(
                          child: Image.network(
                            'http://pic.c-ctrip.com/platform/h5/home/icon-gg@2x.png',
                            // width: 100,
                            height: 20,
                          ),
                          // margin: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(left: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.all(7),
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 5,
                      top: 2,
                      bottom: 2,
                    ),
                    // 设置装饰器
                    decoration: BoxDecoration(
                      // 圆角
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      // 设置背景渐变
                      gradient: LinearGradient(
                        // 渐变开始颜色，渐变结束颜色
                        colors: [
                          Color(int.parse('0xffff4e63')),// 0xff + ff4e63
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
                            fontSize: 14.0,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
