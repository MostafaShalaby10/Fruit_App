class SubCat {
  num? id;
  num? ord;
  String? type;
  num? parentId;
  String? nameEn;
  String? name;
  String? img;
  String? detailsEn;
  String? details;
  List<dynamic>? products;

  SubCat({
    this.id,
    this.ord,
    this.type,
    this.parentId,
    this.nameEn,
    this.name,
    this.img,
    this.detailsEn,
    this.details,
    this.products,
  });

  factory SubCat.fromJson(Map<String, dynamic> json) {
    return SubCat(
      id: num.tryParse(json['id'].toString()),
      ord: num.tryParse(json['ord'].toString()),
      type: json['type']?.toString(),
      parentId: num.tryParse(json['parent_id'].toString()),
      nameEn: json['name_en']?.toString(),
      name: json['name']?.toString(),
      img: json['img']?.toString(),
      detailsEn: json['details_en']?.toString(),
      details: json['details']?.toString(),
      products: List<dynamic>.from(json['products'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (ord != null) 'ord': ord,
      if (type != null) 'type': type,
      if (parentId != null) 'parent_id': parentId,
      if (nameEn != null) 'name_en': nameEn,
      if (name != null) 'name': name,
      if (img != null) 'img': img,
      if (detailsEn != null) 'details_en': detailsEn,
      if (details != null) 'details': details,
      if (products != null) 'products': products,
    };
  }
}
