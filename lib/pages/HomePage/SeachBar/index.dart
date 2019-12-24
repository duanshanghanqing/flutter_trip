import 'package:flutter/material.dart';

class SeachBar extends StatefulWidget {
  @override
  _SeachBarState createState() => _SeachBarState();
}

class _SeachBarState extends State<SeachBar> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: Row(
            children: <Widget>[
              Text(
                '呼伦贝尔',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.expand_more,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Expanded(
          // ConstrainedBox即创建一个Widget，该Widget对其子child施加附加约束。之前在constrain也有简单使用，即该组件一般集成在constrain中使用。
          // http://www.imooc.com/article/286213
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 25,
              // maxWidth: 200,
            ),
            child: Form(
              key: _formKey,
              // 使用 Form 表单后，使用 TextFormField 代替  TextField 输入框
              child: TextFormField(
                // InputDecoration: 设置输入框的样式修饰器
                decoration: InputDecoration(
                  // 设置内容填充，设置对称关系
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.0, // 上下对称
                    horizontal: 10.0, // 水平左右对称
                  ),
                  hintText: '请输入搜索内容',
                  // prefixIcon: Icon(Icons.search),
                  // contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), // 设置圆角
                    borderSide: BorderSide.none, // 设置边界线，没有
                  ),
                  filled: true, // 设置填满
                  fillColor: Color(0xffaaaaaa), // 填充颜色
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
        Text('搜索')
      ],
    );
  }
}
