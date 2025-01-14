
class UserModel {
  int? id;
  String? email;
  String? otp;
  String? createdAt;
  String? updatedAt;

  UserModel({this.id, this.email, this.otp, this.createdAt, this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    otp = json['otp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}