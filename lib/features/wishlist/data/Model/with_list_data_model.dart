import 'package:cruftybay/features/wishlist/data/Model/wish_list_model.dart';

class WishListDataModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  WishListDataModel({this.code, this.status, this.msg, this.data});

  WishListDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['code'] = this.code;
  //   data['status'] = this.status;
  //   data['msg'] = this.msg;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   return data;
  // }
}

class Data {
  List<Results>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  Data(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (this.results != null) {
  //     data['results'] = this.results!.map((v) => v.toJson()).toList();
  //   }
  //   data['total'] = this.total;
  //   data['first_page'] = this.firstPage;
  //   data['previous'] = this.previous;
  //   data['next'] = this.next;
  //   data['last_page'] = this.lastPage;
  //   return data;
  // }
}

class Results {
  String? sId;
  WishLIst? product;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Results(
      {this.sId,
        this.product,
        this.user,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Results.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product =
    json['product'] != null ? WishLIst.fromJson(json['product']) : null;
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['_id'] = this.sId;
  //   if (this.product != null) {
  //     data['product'] = this.product!.toJson();
  //   }
  //   data['user'] = this.user;
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['__v'] = this.iV;
  //   return data;
  // }
}


