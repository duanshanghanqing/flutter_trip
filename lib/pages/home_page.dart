import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/dao/home_dao.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';
import 'package:flutter_trip/model/sales_box_model.dart';
import 'package:flutter_trip/widget/grid_nav/index.dart';
import 'package:flutter_trip/widget/local_nav/index.dart';
import 'package:flutter_trip/widget/sub_nav/index.dart';
import 'package:flutter_trip/widget/sales_box/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  // 图片地址
  final List imgs = [
    "https://aecpm.alicdn.com/simba/img/TB1JNHwKFXXXXafXVXXSutbFXXX.jpg",
    "http://aecpm.alicdn.com/simba/img/TB183NQapLM8KJjSZFBSutJHVXa.jpg",
    "http://img.alicdn.com/tfs/TB1Y.uXlubviK0jSZFNXXaApXXa-520-280.jpg",
  ];

  // 滑动透明的
  double appBarAlpha = 0;

  // 本地导航
  List<CommonModel> localNavList = [];
  // 网格导航
  GridNavModel gridNav;
  // 子导航
  List<CommonModel> subNavList = [];

  SalesBoxModel salesBox;

  void initState() {
    super.initState();
    // 初始化获取数据
    loadData();
  }

  // 滚动监听,设置透明值
  _onScroll(offset) {
    double alpha = offset / 100;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  loadData() async {
    try {
      var result = await HomeDao.fetch();
      setState(() {
        localNavList = result.localNavList;
        gridNav = result.gridNav;
        subNavList = result.subNavList;
        salesBox = result.salesBox;
      });
      // print(json.encode(gridNav));
      // 将dart实例转换成json字符串，方便查看
      // print(json.encode(result));
    } catch (e) {
      print('接口报错了');
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      // appBar: AppBar(
      //   title: Text('首页'),
      // ),
      // MediaQuery.removePadding： 移除页面上填充
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        // NotificationListener<ScrollNotification>():监听子Widget滚动
        // https://www.jianshu.com/p/6dc3cca1d99a
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            // notification is ScrollUpdateNotification： 表示滚动的时候才执行
            // notification.dept == 0 ：表示是否是最外层元素滚动。NotificationListener会向下去找，ListView是第0个元素
            if (notification is ScrollUpdateNotification &&
                notification.depth == 0) {
              _onScroll(notification.metrics.pixels);
            }
            return true;
          },
          // Swiper容器
          // Stack(): 折叠层，可以让元素重叠在一起，类似绝对定位的效果
          child: Stack(
            children: <Widget>[
              ListView(
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  // 轮播图
                  Container(
                    height: 160,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          // index: 表示当前滚动到第几个了
                          imgs[index],
                          // fit： 适配方式
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: imgs.length,
                      autoplay: true,
                      pagination: SwiperPagination(),
                    ),
                  ),
                  // 本地导航
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                    child: LocalNav(
                      localNavList: localNavList,
                    ),
                  ),
                  // 网格布局
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                    child: GridNav(
                      gridNav: gridNav,
                    ),
                  ),
                  // 子模块
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                    child: SubNav(
                      subNavList: subNavList,
                    ),
                  ),
                  // 
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                    child: SalesBox(
                      salesBox: salesBox
                    ),
                  ),
                  Container(
                    height: 500,
                    color: Colors.amber[600],
                    child: FlatButton(
                      child: Text("获取数据"),
                      textColor: Colors.blue,
                      onPressed: () {
                        loadData();
                      },
                    ),
                  ),
                  Container(
                    height: 500,
                    color: Colors.amber[500],
                    child: const Center(child: Text('Entry B')),
                  ),
                  Container(
                    height: 500,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                ],
              ),
              // 放在后面的会叠在前面的上面
              // Opacity():设置透明度,里面包着一个盒子
              Opacity(
                opacity: appBarAlpha,
                child: Container(
                  height: 80,
                  // 设置装饰颜色
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('首页'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
