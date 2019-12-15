import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/home_dao.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("获取数据"),
          textColor: Colors.blue,
          onPressed: () async {
            // 使用 Promise 方式
            // HomeDao.fetch().then((result) {
            //   print(result.config.searchUrl);
            // }).catchError((e) {
            //   print(e.toString());
            // });
            try {
              var result = await HomeDao.fetch();
              print(result.config.searchUrl);
              // 将dart实例转换成json字符串，方便查看
              print(json.encode(result));
            } catch (e) {
              print(e.toString());
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
