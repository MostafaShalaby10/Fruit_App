import 'package:dio/dio.dart';
import 'package:task_one/core/networking/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future getResponse({
    required String endPoint,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.get(
      ApiConstants.baseUrl + endPoint,
      options: Options(contentType: "application/json", headers: headers),
    );
  }

  Future postResponse({
    required String endPoint,
    required dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.post(
      ApiConstants.baseUrl + endPoint,

      options: Options(contentType: "application/json", headers: headers),
      data: data,
    );
  }
}
