import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/search_model.dart';
import 'package:flutter_trip/model/seach_model.dart';
import './SeachBar/index.dart';

class SearchPage extends StatefulWidget {
  Function switchTab;

  SearchPage({Key key, @required this.switchTab}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin {
  String showText = '';

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
                onleftArrowClick: () {
                  widget.switchTab(0);
                },
                onChage: (String val) {
                  print(val);
                },
                onSearch: (String val) {
                  // print(val);
                  SearchDao.fetch().then((SearchModel value) {
                    if (value?.data?.length != 0) {
                      print(value.data[0].url);
                      setState(() {
                        showText = value.data[0].url;
                      });
                    }
                  });
                }),
          ),
          Text(showText),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
