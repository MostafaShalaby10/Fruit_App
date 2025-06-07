
import 'package:dio/dio.dart';

class UpdateDataRequestModel {
  String? name;
  String? mobile;
  String? email;
  dynamic photo;

  UpdateDataRequestModel({
    required this.name,
    required this.mobile,
    required this.email,
    this.photo,
  });

  dynamic toJson() async {
    return FormData.fromMap({
      "name": name,
      "email": email,
      "mobile": mobile,
      "profile_photo_path": await MultipartFile.fromFile(
        photo.path,
        filename: "Profile",
      ),
    });
  }
}
