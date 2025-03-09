import 'package:cruftybay/features/product/data/model/product_list_data_model.dart';

class ProductListPaginationModel {
  int? code;
  String? status;
  String? msg;
  ProductListDataModel? data;

  ProductListPaginationModel({this.code, this.status, this.msg, this.data});

  ProductListPaginationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? ProductListDataModel.fromJson(json['data']) : null;
  }

}


