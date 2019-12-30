import 'package:flutter/material.dart';

class SeachBar extends StatefulWidget {
  Function switchTab;

  // 设置透明度
  double appBarAlpha = 0;

  // 输入框默认值
  String defaultText;

  SeachBar({Key key, @required this.appBarAlpha, this.defaultText = '',this.switchTab})
      : super(key: key);

  @override
  _SeachBarState createState() => _SeachBarState();
}

class _SeachBarState extends State<SeachBar> {
  final TextEditingController _controller = TextEditingController();

  int length = 0;

  void initState() {
    // 设置回显默认值
    if (widget.defaultText != '') {
      _controller.text = widget.defaultText;
      length = widget.defaultText.length;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              if (widget.switchTab != null) {
                widget.switchTab(0);
              }
            },
          ),
          Expanded(
            flex: 1,
            child: TextField(
              controller: _controller,
              autofocus: true,
              style: const TextStyle(
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
                suffixIcon: length == 0
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
                            length = 0;
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
              onChanged: (val) {
                // _controller.text = val;
                // WidgetsBinding.instance.addPersistentFrameCallback((_) => {
                //   _controller.text = val
                // });
                setState(() {
                  length = val.length;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child: Text('搜索'),
          ),
        ],
      ),
    );
  }
}
