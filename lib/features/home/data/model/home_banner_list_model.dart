import 'package:cruftybay/features/home/data/model/bannner_model.dart';

class BannerListModel {
  String? msg;
  List<BannerModel>? bannerList;

  BannerListModel({this.msg, this.bannerList});

  BannerListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      bannerList = <BannerModel>[];
      json['data'].forEach((v) {
        bannerList!.add(new BannerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (bannerList != null) {
      data['data'] = bannerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

