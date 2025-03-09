import 'package:cruftybay/features/common/data/models/category/category_pagination_model.dart';

class ProductDetailsModel {
  String? sId;
  String? title;
  ProductBrandModel? brand;
  List<CategoryItemModel>? categories;
  String? slug;
  String? metaDescription;
  String? description;
  List<String>? photos;
  List<String>? colors;
  List<String>? sizes;
  List<String>? tags;
  int? regularPrice;
  int? currentPrice;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  bool? inCart;
  bool? inWishlist;

  ProductDetailsModel({
    this.sId,
    this.title,
    this.brand,
    this.categories,
    this.slug,
    this.metaDescription,
    this.description,
    this.photos,
    this.colors,
    this.sizes,
    this.tags,
    this.regularPrice,
    this.currentPrice,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.inCart,
    this.inWishlist,
  });

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'] != null ? ProductBrandModel.fromJson(json['brand']) : null;
    if (json['categories'] != null) {
      categories = <CategoryItemModel>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryItemModel.fromJson(v));
      });
    }
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    photos = json['photos'].cast<String>();
    colors = json['colors'].cast<String>();
    sizes = json['sizes'].cast<String>();
    tags = json['tags'].cast<String>();
    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    inCart = json['in_cart'];
    inWishlist = json['in_wishlist'];
  }
}

class ProductBrandModel {
  String? sId;
  String? title;
  String? slug;
  String? icon;

  ProductBrandModel({this.sId, this.title, this.slug, this.icon});

  ProductBrandModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['icon'] = icon;
    return data;
  }
}
