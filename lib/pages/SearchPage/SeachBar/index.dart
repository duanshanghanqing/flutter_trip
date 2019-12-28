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

    return Padding(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          // 设置输入框宽高
          // maxWidth: 200,
          maxHeight: 30,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
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
                    fillColor: Color.fromRGBO(220, 220, 220, 1), // 亮灰色,
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
            Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
              child: Text('搜索'),
            ),
          ],
        ),
      ),
    );
  }
}
