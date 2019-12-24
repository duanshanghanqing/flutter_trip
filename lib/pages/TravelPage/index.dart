import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
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
