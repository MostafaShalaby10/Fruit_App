import 'data.dart';

class AddOrderResponseModel {
  bool? result;
  String? errorMesage;
  String? errorMesageEn;
  num? insertId;
  Data? data;

  AddOrderResponseModel({
    this.result,
    this.errorMesage,
    this.errorMesageEn,
    this.insertId,
    this.data,
  });

  factory AddOrderResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AddOrderResponseModel(
      result: json['result']?.toString().contains("true"),
      errorMesage: json['error_mesage']?.toString(),
      errorMesageEn: json['error_mesage_en']?.toString(),
      insertId: num.tryParse(json['insert_id'].toString()),
      data:
          json['data'] == null
              ? null
              : Data.fromJson(
                Map<String, dynamic>.from(json['data']),
              ),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (result != null) 'result': result,
      if (errorMesage != null) 'error_mesage': errorMesage,
      if (errorMesageEn != null) 'error_mesage_en': errorMesageEn,
      if (insertId != null) 'insert_id': insertId,
      if (data != null)
        'data':
            data?.toJson(),
    };
  }
}
