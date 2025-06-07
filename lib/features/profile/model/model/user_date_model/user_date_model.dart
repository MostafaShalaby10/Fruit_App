import 'data.dart';

class UserDateModel {
  bool? status;
  String? message;
  Data? data;

  UserDateModel({this.status, this.message, this.data});

  factory UserDateModel.fromJson(Map<String, dynamic> json) {
    return UserDateModel(
      status: json['status']?.toString().contains("true"),
      message: json['message']?.toString(),
      data:
          json['data'] == null
              ? null
              : Data.fromJson(Map<String, dynamic>.from(json['data'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (status != null) 'status': status,
      if (message != null) 'message': message,
      if (data != null) 'data': data?.toJson(),
    };
  }
}
