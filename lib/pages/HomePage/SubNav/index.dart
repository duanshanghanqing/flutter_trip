import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/widget/WebView/index.dart';

class SubNav extends StatelessWidget {
  final List<CommonModel> subNavList;

  const SubNav({Key key, @required this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (subNavList == null) {
      return null;
    }

    // 计算每一行显示的个数
    int rouNumber = (subNavList.length / 2 + 0.5).toInt();

    List<Widget> items = [];
    if (subNavList.length > 0) {
      subNavList.forEach((item) {
        items.add(_item(context, item));
      });
      // items.add(_item(context, subNavList[0]));
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items.sublist(0, rouNumber),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items.sublist(rouNumber, subNavList.length),
            ),
          ],
        ),
      ),
    );
  }

  // 计算展示个数
  Widget _item(BuildContext context, CommonModel item) {
    // print(item.title);
    // print(item.url);
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebView(
                url: item.url,
                // statusBarColor: gridNavItem.mainItem.statusBarColor,
                hideAppBar: item.hideAppBar,
                title: item.title,
              ),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Image.network(
              item.icon,
              width: 18,
              height: 18,
            ),
            Padding(
              padding: EdgeInsets.all(3),
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
