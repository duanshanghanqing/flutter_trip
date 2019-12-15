import 'package:flutter_trip/model/config_model.dart';

class SalesBoxModel {
  final String icon;
  final String moreUrl;
  final ConfigModel bigCard1;
  final ConfigModel bigCard2;
  final ConfigModel smallCard1;
  final ConfigModel smallCard2;
  final ConfigModel smallCard3;
  final ConfigModel smallCard4;

  SalesBoxModel(
      {this.icon,
      this.moreUrl,
      this.bigCard1,
      this.bigCard2,
      this.smallCard1,
      this.smallCard2,
      this.smallCard3,
      this.smallCard4});

  factory SalesBoxModel.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return SalesBoxModel(
        icon: json['icon'],
        moreUrl: json['moreUrl'],
        bigCard1: ConfigModel.fromJson(json['bigCard1']),
        bigCard2: ConfigModel.fromJson(json['bigCard2']),
        smallCard1: ConfigModel.fromJson(json['smallCard1']),
        smallCard2: ConfigModel.fromJson(json['smallCard2']),
        smallCard3: ConfigModel.fromJson(json['smallCard3']),
        smallCard4: ConfigModel.fromJson(json['smallCard4']),
      );
    }
    return SalesBoxModel();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['moreUrl'] = this.moreUrl;
    data['bigCard1'] = this.bigCard1;
    data['bigCard2'] = this.bigCard2;
    data['smallCard1'] = this.smallCard1;
    data['smallCard2'] = this.smallCard2;
    data['smallCard3'] = this.smallCard3;
    data['smallCard4'] = this.smallCard4;
    return data;
  }
}
