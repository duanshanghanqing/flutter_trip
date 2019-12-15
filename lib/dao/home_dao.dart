import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_trip/model/home_model.dart';

const HOME_URL = 'https://www.devio.org/io/flutter_app/json/home_page.json';

class HomeDao {
  static Future<HomeModel> fetch() async {
    var response;
    try {
      response = await http.get(HOME_URL);
    } catch (e) {
      print(e.toString());
    }

    if (response.statusCode == 200) {
      Utf8Decoder utf8Codecoder = Utf8Decoder();
      var result = json.decode(utf8Codecoder.convert(response.bodyBytes));
      var homeModel = HomeModel.fromJson(result);
      // print(homeModel.config.searchUrl);
      return homeModel;
    } else {
      throw Exception('请求接口错误');
    }
  }
}
