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
        Icon(
          Icons.search,
          // color: _activeColor,
        ),
        Expanded(
          child: ClipRRect(
            // 设置圆角
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            // 填充
            child: Container(
              // height: 40,
              decoration: BoxDecoration(
                // 边色与边宽度
                border: Border.all(color: Color(0xfff2f2f2), width: 1),
                // 颜色
                // color: Colors.red,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(
                        
                        color: Colors.white,
                        fontSize: 16.0,
                        // backgroundColor: Colors.yellow,
                        // height: 1,
                      ),
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                        hintText: '请输入内容', // 默认回显
                        // border: InputBorder.none, // 无边框
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Text('搜索')
      ],
    );
  }
}
