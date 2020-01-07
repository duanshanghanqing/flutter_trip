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
  // 搜索列表
  List<Widget> searchItemlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('搜索'),
      // ),
      resizeToAvoidBottomPadding: false, // 设置这个效果不明显
      // SingleChildScrollView: 完美解决键盘弹起导致界面布局异常问题
      body: SingleChildScrollView(
        child: Column(
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
                  // print(val);
                  _search(val);
                },
                onSearch: (String val) {
                  _search(val);
                  // print(val);
                },
              ),
            ),
            // Text(showText),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              // 获取屏幕高度，减去搜索框高度
              height: MediaQuery.of(context).size.height - 125,
              child: ListView(
                // padding: const EdgeInsets.all(8),
                // children: <Widget>[
                //   Container(
                //     height: 500,
                //     color: Colors.amber[600],
                //     child: const Center(child: Text('Entry A')),
                //   ),
                // ],
                children: searchItemlist,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _search(String val) {
    SearchDao.fetch(val).then((SearchModel value) {
      if (value?.data?.length != 0) {
        print(value.data[0].url);
        List<Widget> arr = [];
        value.data.forEach((item) {
          arr.add(_item(item));
        });
        setState(() {
          searchItemlist = arr;
        });
      }
    });
  }

  Widget _item(SearchItem item) {
    return Container(
      height: 100,
      color: Colors.amber[100],
      child: Center(child: Text(item.url)),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
