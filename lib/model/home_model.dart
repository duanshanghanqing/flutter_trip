import 'package:flutter_trip/model/config_model.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';
import 'package:flutter_trip/model/sales_box_model.dart';

class HomeModel {
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;
  final GridNavModel gridNav;
  final SalesBoxModel salesBox;

  HomeModel(
      {this.config,
      this.bannerList,
      this.localNavList,
      this.subNavList,
      this.gridNav,
      this.salesBox});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      var bannerListJson = json['bannerList'] as List; // 转换成 List 类型
      List<CommonModel> bannerList =
          bannerListJson.map((item) => CommonModel.fromJson(item)).toList();
      var localNavListJson = json['localNavList'] as List;
      List<CommonModel> localNavList =
          localNavListJson.map((item) => CommonModel.fromJson(item)).toList();
      var subNavListJson = json['subNavList'] as List;
      List<CommonModel> subNavList =
          subNavListJson.map((item) => CommonModel.fromJson(item)).toList();

      return HomeModel(
        config: ConfigModel.fromJson(json['config']),
        bannerList: bannerList,
        localNavList: localNavList,
        subNavList: subNavList,
        gridNav: GridNavModel.fromJson(json['gridNav']),
        salesBox: SalesBoxModel.fromJson(json['salesBox']),
      );
    }
    return HomeModel();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['config'] = this.config;
    data['bannerList'] = this.bannerList;
    data['localNavList'] = this.localNavList;
    data['subNavList'] = this.subNavList;
    data['gridNav'] = this.gridNav;
    data['salesBox'] = this.salesBox;
    return data;
  }
}
