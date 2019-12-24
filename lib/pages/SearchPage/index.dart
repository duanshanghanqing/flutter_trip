import 'package:flutter/material.dart';
// import 'package:flutter_trip/widget/seach_bar/index.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
      ),
      body: Column(
        children: <Widget>[
          // SeachBar(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
