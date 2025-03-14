class WishLIst {
  String? sId;
  String? title;
  String? brand;
  List<String>? categories;
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
  int? iV;

  WishLIst(
      {this.sId,
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
        this.iV});

  WishLIst.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'];
    categories = json['categories'].cast<String>();
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
    iV = json['__v'];
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['_id'] = this.sId;
//   data['title'] = this.title;
//   data['brand'] = this.brand;
//   data['categories'] = this.categories;
//   data['slug'] = this.slug;
//   data['meta_description'] = this.metaDescription;
//   data['description'] = this.description;
//   data['photos'] = this.photos;
//   data['colors'] = this.colors;
//   data['sizes'] = this.sizes;
//   data['tags'] = this.tags;
//   data['regular_price'] = this.regularPrice;
//   data['current_price'] = this.currentPrice;
//   data['quantity'] = this.quantity;
//   data['createdAt'] = this.createdAt;
//   data['updatedAt'] = this.updatedAt;
//   data['__v'] = this.iV;
//   return data;
// }
}