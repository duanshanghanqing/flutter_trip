import 'dart:async';
import 'dart:convert';
import 'package:flutter_trip/model/seach_model.dart';
import 'package:http/http.dart' as http;

class SearchDao {
  static Future<SearchModel> fetch(String value) async {//String url
    if (value == null) {
      return SearchModel.fromJson(null);
    }
    var url = "https://m.ctrip.com/restapi/h5api/globalsearch/search?userid=M2208559994&source=mobileweb&action=mobileweb&keyword=${value}";
    var response;
    try {
      response = await http.get(url);
    } catch (e) {
      print(e.toString());
    }

    if (response.statusCode == 200) {
      Utf8Decoder utf8Codecoder = Utf8Decoder();
      var result = json.decode(utf8Codecoder.convert(response.bodyBytes));
      return SearchModel.fromJson(result);
    }
  }
}
