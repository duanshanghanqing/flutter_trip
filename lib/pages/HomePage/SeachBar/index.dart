import 'package:flutter/material.dart';

class SeachBar extends StatefulWidget {
  // 设置透明度
  double appBarAlpha = 0;
  Function switchTab;
  SeachBar({Key key, @required this.appBarAlpha, this.switchTab})
      : super(key: key);

  @override
  _SeachBarState createState() => _SeachBarState();
}

class _SeachBarState extends State<SeachBar> {
  @override
  Widget build(BuildContext context) {
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
            // 裁剪
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50.0)), // 圆角
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity, // 撑满
                  height: 30,
                  // 设置装饰器
                  decoration: BoxDecoration(
                    color: fillColor,
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                          size: 26,
                        ),
                      ),
                      Expanded(
                        flex: 1, // 撑满
                        child: GestureDetector(
                          onTap: () {
                            // 点击切换到索引是1的tab搜索页面
                            widget.switchTab(1);
                          },
                          child: Container(
                            width: double.infinity, // 撑满
                            // height: double.infinity,
                            child: Text(
                              '请输入搜索内容',
                              style: TextStyle(
                                color: Color.fromRGBO(105, 105, 105, 1),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                        child: Icon(
                          Icons.mic_none,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
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
