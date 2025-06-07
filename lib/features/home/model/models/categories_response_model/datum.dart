import 'sub_cat.dart';

class Datum {
  num? id;
  num? ord;
  String? type;
  num? parentId;
  String? nameEn;
  String? name;
  String? img;
  String? detailsEn;
  String? details;
  List<SubCat>? subCat;

  Datum({
    this.id,
    this.ord,
    this.type,
    this.parentId,
    this.nameEn,
    this.name,
    this.img,
    this.detailsEn,
    this.details,
    this.subCat,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: num.tryParse(json['id'].toString()),
      ord: num.tryParse(json['ord'].toString()),
      type: json['type']?.toString(),
      parentId: num.tryParse(json['parent_id'].toString()),
      nameEn: json['name_en']?.toString(),
      name: json['name']?.toString(),
      img: json['img']?.toString(),
      detailsEn: json['details_en']?.toString(),
      details: json['details']?.toString(),
      subCat:
          (json['sub_cat'] as List<dynamic>?)
              ?.map((e) => SubCat.fromJson(Map<String, dynamic>.from(e)))
              .toList(),
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
      if (subCat != null) 'sub_cat': subCat?.map((e) => e.toJson()).toList(),
    };
  }
}
