import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  Function switchTab;

  TravelPage({Key key, @required this.switchTab}) : super(key: key);

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('旅拍'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
