import 'package:flutter/material.dart';
import 'dart:async';

class SeachBar extends StatefulWidget {
  // 点击左测返回按钮点击
  Function onleftArrowClick;

  // 监听表单输入
  Function onChage;

  // 监听点击搜索
  Function onSearch;

  // 设置透明度
  double appBarAlpha = 0;

  // 输入框默认值
  String defaultText;

  // 构造函数
  SeachBar({
    Key key,
    @required this.appBarAlpha,
    this.defaultText = '',
    this.onleftArrowClick,
    this.onChage,
    this.onSearch,
  }) : super(key: key);

  @override
  _SeachBarState createState() => _SeachBarState();
}

class _SeachBarState extends State<SeachBar> {
  final TextEditingController _controller = TextEditingController();

  String text = '';

  void initState() {
    // 设置回显默认值
    if (widget.defaultText != '') {
      _controller.text = widget.defaultText;
      text = widget.defaultText;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer t;
    return ConstrainedBox(
      constraints: BoxConstraints(
        // 设置输入框宽高
        // maxWidth: 200,
        maxHeight: 30,
      ),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: Color.fromRGBO(190, 190, 190, 1),
              ),
            ),
            onTap: () {
              if (widget.onleftArrowClick != null) {
                widget.onleftArrowClick();
              }
            },
          ),
          Expanded(
            flex: 1,
            child: TextField(
                controller: _controller,
                autofocus: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  textBaseline: TextBaseline.ideographic,
                ),
                // InputDecoration: 设置输入框的样式修饰器
                decoration: InputDecoration(
                  // labelText: "请输入内容",//输入框内无文字时提示内容，有内容时会自动浮在内容上方
                  // 设置内容填充，设置对称关系
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.0, // 上下对称
                    horizontal: 0.0, // 水平左右对称
                  ),
                  hintText: '请输入搜索内容',
                  // 输入框左边图标
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromRGBO(190, 190, 190, 1),
                    size: 24,
                  ),
                  suffixIcon: text == ''
                      ? GestureDetector(
                          child: Icon(
                            Icons.mic_none, // 录音
                            size: 24,
                            color: Color.fromRGBO(190, 190, 190, 1),
                          ),
                          onTap: () {},
                        )
                      : GestureDetector(
                          child: Icon(
                            Icons.close, // 清空
                            size: 24,
                            color: Color.fromRGBO(190, 190, 190, 1),
                          ),
                          onTap: () {
                            // 保证在组件build的第一帧时才去触发取消清空内容
                            // WidgetsBinding.instance.addPersistentFrameCallback((_) => _controller.clear());
                            // _controller.text = '';
                            setState(() {
                              text = '';
                            });
                            _controller.clear();
                          },
                        ), //输入框右边图片
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), // 设置圆角
                    borderSide: BorderSide.none, // 设置边界线，没有
                  ),
                  filled: true, // 设置填满
                  fillColor: Color.fromRGBO(220, 220, 220, 1), // 亮灰色,
                ),
                // 校验
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Please enter some text';
                //   }
                //   return null;
                // },
                onChanged: (String val) {
                  // _controller.text = val;
                  // WidgetsBinding.instance.addPersistentFrameCallback((_) => {
                  //   _controller.text = val
                  // });
                  setState(() {
                    text = val;
                  });
                  if (widget.onChage != null) {
                    // 处理防抖动
                    if (t != null) {
                      t.cancel();
                      t = null;
                    }
                    const timeout = Duration(seconds: 3);
                    // print('currentTime =' + DateTime.now().toString());
                    t = Timer(timeout, () {
                      //到时回调
                      // print('after 5s Time =' + DateTime.now().toString());
                      widget.onChage(val);
                    });
                  }
                },
                onSubmitted: (String val) {
                  if (widget.onSearch != null) {
                    widget.onSearch(val);
                  }
                }),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child: GestureDetector(
              child: Text('搜索'),
              onTap: () {
                if (widget.onSearch != null) {
                  widget.onSearch(text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
