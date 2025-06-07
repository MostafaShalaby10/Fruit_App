import 'datum.dart';

class CategoriesResponseModel {
  bool? result;
  String? errorMessage;
  String? errorMessageEn;
  List<Datum>? data;

  CategoriesResponseModel({
    this.result,
    this.errorMessage,
    this.errorMessageEn,
    this.data,
  });

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoriesResponseModel(
      result: json['result']?.toString().contains("true"),
      errorMessage: json['error_message']?.toString(),
      errorMessageEn: json['error_message_en']?.toString(),
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Datum.fromJson(Map<String, dynamic>.from(e)))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (result != null) 'result': result,
      if (errorMessage != null) 'error_message': errorMessage,
      if (errorMessageEn != null) 'error_message_en': errorMessageEn,
      if (data != null) 'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}
