import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// 采坑链接：https://www.jianshu.com/p/1b9380787dc9
class WebView extends StatefulWidget {
  final String url; // 打开页面的url
  final String statusBarColor; // 导航栏颜色
  final String title; // 标题
  final bool hideAppBar; // 是否隐藏AppBar
  final bool backForbid; // 返回按钮的控制

  const WebView(
      {Key key,
      this.url,
      this.statusBarColor,
      this.title,
      this.hideAppBar,
      this.backForbid})
      : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  // Instance of WebView plugin
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  // 保存 url 变化后的句柄
  StreamSubscription<String> _onUrlChanged;
  // 页面状态发生变化的句柄
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  // 页面加载错误
  StreamSubscription<WebViewHttpError> _onHttpError;

  @override
  void initState() {
    super.initState();
    // 防止页面重复打开
    flutterWebViewPlugin.close();
    // 监听页面url发生变化的时候触发
    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {});
    _onStateChanged =
        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      // 开始加载的时候
      if (state.type == WebViewState.startLoad) {}
    });
    _onHttpError =
        flutterWebViewPlugin.onHttpError.listen((WebViewHttpError error) {
      print(error);
    });
  }

  @override
  void dispose() {
    // 取消监听
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 状态栏颜色，没传就用白色，rgb颜色值
    String statusBarColor = widget.statusBarColor ?? 'ffffff';
    Color titleColor = statusBarColor == 'ffffff' ? Colors.black : Colors.white;

    return WebviewScaffold(
      url: widget.url,
      withZoom: true, // 是否允许缩放
      withLocalStorage: true, // 启用本地存储
      hidden: true, // 默认隐藏
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: titleColor,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            print('home app bar');
            // 点击关闭返回到首页
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(
          color: titleColor,
          opacity: 1,
          size: 24,
        ),
        backgroundColor: Color(int.parse('0xff' + statusBarColor)),
        elevation: 0,
        actions: <Widget>[
          // Center(
          //   child: Text('所有订单'),
          // ),
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              print('点击菜单');
            },
          ),
        ],
      ),
      initialChild: Container(
        color: Colors.white,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  }
}
/*
class _WebViewState extends State<WebView> {
  // Instance of WebView plugin
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  // 保存 url 变化后的句柄
  StreamSubscription<String> _onUrlChanged;
  // 页面状态发生变化的句柄
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  // 页面加载错误
  StreamSubscription<WebViewHttpError> _onHttpError;

  @override
  void initState() {
    super.initState();
    // 防止页面重复打开
    flutterWebViewPlugin.close();
    // 监听页面url发生变化的时候触发
    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {});
    _onStateChanged =
        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      // 开始加载的时候
      if (state.type == WebViewState.startLoad) {}
    });
    _onHttpError =
        flutterWebViewPlugin.onHttpError.listen((WebViewHttpError error) {
      print(error);
    });
  }

  @override
  void dispose() {
    // 取消监听
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 状态栏颜色，没传就用白色，rgb颜色值
    String statusBarColor = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor =
        statusBarColor == 'ffffff' ? Colors.black : Colors.white;

    return Scaffold(
      body: Column(
        children: <Widget>[
          // 自定义导航
          // 把字符串颜色转换成 十六进制 颜色
          _appBar(Color(int.parse('0xff' + statusBarColor)), backButtonColor),
          // Expanded组件可以使Row、Column、Flex等子组件在其主轴方向上展开并填充可用空间(例如，Row在水平方向，Column在垂直方向)。如果多个子组件展开，可用空间会被其flex factor(表示扩展的速度、比例)分割。
          // https://blog.csdn.net/chunchun1230/article/details/82460257
          Expanded(
            // WebviewScaffold(): Webview 页面
            child: WebviewScaffold(
              url: widget.url,
              withZoom: true, // 是否允许缩放
              withLocalStorage: true, // 启用本地存储
              hidden: true, // 默认隐藏
              // 初始化加载前界面
              initialChild: Container(
                color: Colors.white,
                child: const Center(
                  child: Text('Waiting.....'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar(Color backgroundColor, Color backButtonColor) {
    if (widget.hideAppBar == false) {
      return Container(
        color: backgroundColor,
        height: 30,
      );
    }
    return Container(
      // FractionallySizedBox(): 撑满屏幕高度
      child: FractionallySizedBox(
        // 宽度也撑满
        widthFactor: 1,
        // Stack(): 绝对定位的方式布局
        child: Stack(
          children: <Widget>[
            // GestureDetector是一个辅助检测手势的类，使用起来非常简单，更重要的是它能检测出很多常用的手势操作，如点击、双击、滑动、Fling等。因此，善用这个类，可以让我们处理触摸事件更加的得心应手。
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: 10, top: 30),
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 26,
                ),
              ),
              onTap: () {
                print('关闭页面');
                // flutterWebViewPlugin.goBack();
                // flutterWebViewPlugin.goForward();
                // flutterWebViewPlugin.reload();
                // flutterWebViewPlugin.close();
              },
            ),
            // 绝对定位的元素
            Positioned(
              left: 0,
              right: 0,
              top: 25,
              // 居中
              child: Center(
                // ?? : 如果为空就取 ''
                child: Text(
                  widget.title ?? '',
                  // 文本样式
                  style: TextStyle(
                    color: backgroundColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
