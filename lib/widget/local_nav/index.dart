import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/widget/webview/index.dart';

class LocalNav extends StatelessWidget {
  final List<CommonModel> localNavList;

  const LocalNav({Key key, @required this.localNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 设置box容器
    return Container(
      height: 65,
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
        child: _items(context),
      ),
    );
  }

  // _: 表示私有方法
  Widget _items(BuildContext context) {
    if (localNavList == null) {
      return null;
    }
    List<Widget> items = [];
    localNavList.forEach((item) {
      items.add(_item(context, item));
    });
    return Row(
      // 平局排列,调整间距
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  Widget _item(BuildContext context, CommonModel item) {
    return GestureDetector(
      onTap: () {
        print("打开H5页面");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(
              url: item.url,
              statusBarColor: item.statusBarColor,
              hideAppBar: true,
              title: item.title,
            ),
          ),
        );
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item.icon,
            width: 32,
            height: 32,
          ),
          Text(
            item.title,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
