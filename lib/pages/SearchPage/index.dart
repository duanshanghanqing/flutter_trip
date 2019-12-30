import 'package:flutter/material.dart';
import './SeachBar/index.dart';

class SearchPage extends StatefulWidget {
  Function switchTab;

  SearchPage({Key key, @required this.switchTab}) : super(key: key);
  
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('搜索'),
      // ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
            child: SeachBar(
              appBarAlpha: 1,
              defaultText: '',
              switchTab: widget.switchTab,
            ),
          ),
          // SeachBar(
          //   appBarAlpha: 1,
          //   defaultText: 'aaaaaaa',
          // ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
