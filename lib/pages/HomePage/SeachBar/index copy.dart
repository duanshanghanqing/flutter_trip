import 'package:flutter/material.dart';

class SeachBar extends StatefulWidget {
  // 设置透明度
  double appBarAlpha = 0;
  SeachBar({Key key, @required this.appBarAlpha}) : super(key: key);

  @override
  _SeachBarState createState() => _SeachBarState();
}

class _SeachBarState extends State<SeachBar> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    var color = Color.fromRGBO(255, 255, 255, 1); // 白色
    var fillColor = color; // 白色
    if (widget.appBarAlpha <= 0) {
      color = color;
      fillColor = fillColor;
    } else {
      color = Color.fromRGBO(0, 0, 0, 1); // 黑色
      fillColor = Color.fromRGBO(220, 220, 220, 1); // 亮灰色
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 27, 0, 3),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
            child: Row(
              children: <Widget>[
                Container(
                  // width: 65,
                  constraints: BoxConstraints(
                    maxWidth: 65,
                    // maxHeight: 50,
                    // minWidth: 65,
                    // minHeight: 50,
                  ),
                  child: Text(
                    '上海',
                    // '${widget.appBarAlpha}',
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: color, //Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.expand_more,
                    color: color, //Color.fromRGBO(255, 255, 255, 1),
                    size: 30,
                  ),
                  margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                ),
              ],
            ),
          ),
          Expanded(
            // ConstrainedBox即创建一个Widget，该Widget对其子child施加附加约束。之前在constrain也有简单使用，即该组件一般集成在constrain中使用。
            // http://www.imooc.com/article/286213
            child: ConstrainedBox(
              constraints: BoxConstraints(
                // 设置输入框宽高
                // maxWidth: 200,
                maxHeight: 30,
              ),
              child: Form(
                key: _formKey,
                // 使用 Form 表单后，使用 TextFormField 代替  TextField 输入框
                child: TextFormField(
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
                      color: Colors.blue,
                      size: 24,
                    ),
                    suffixIcon: Icon(
                      Icons.mic_none,
                      size: 24,
                    ), //输入框右边图片
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15), // 设置圆角
                      borderSide: BorderSide.none, // 设置边界线，没有
                    ),
                    filled: true, // 设置填满
                    fillColor: fillColor, //Colors.white, // 填充颜色
                  ),
                  // 校验
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Icon(
              Icons.message,
              color: color, //Color.fromRGBO(255, 255, 255, 1),
              size: 28,
            ),
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
          ),
        ],
      ),
    );
  }
}
