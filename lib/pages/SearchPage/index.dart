import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/search_model.dart';
import 'package:flutter_trip/model/seach_model.dart';
import './SeachBar/index.dart';
import 'package:flutter_trip/widget/WebView/index.dart';

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
                // 但是发现ListView无法充满全面，顶部会有一个导航栏宽度的缝隙，应该是自适应屏幕造成，这时只需将ListView的padding属性，设置为：EdgeInsets.only(top: 0) 即可解决问题。
                padding: EdgeInsets.only(top: 0),
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
        // print(value.data[0].url);
        List<Widget> arr = [];
        value.data.forEach((item) {
          arr.add(_item(item, context));
        });
        setState(() {
          searchItemlist = arr;
        });
      }
    });
  }

  Widget _item(SearchItem item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print(item.url + 'index');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(
              url: item.url + 'index',
              // statusBarColor: gridNavItem.item1.statusBarColor,
              hideAppBar: true,
              title: item.word,
            ),
          ),
        );
      },
      child: Container(
        // height: 40,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            // Text(item.url),
            Icon(
              Icons.search,
              color: Color.fromRGBO(190, 190, 190, 1),
              size: 20,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(item.word),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Color.fromRGBO(190, 190, 190, 1),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
