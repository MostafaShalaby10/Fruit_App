import 'package:task_one/core/networking/api_service.dart';
import 'package:task_one/features/authentication/signup/model/signup_repo_interface.dart';

class SignupRepoImp implements SignupRepoInterface {
  final ApiService _apiService;

  SignupRepoImp(this._apiService);

  @override
  Future signupRequest({required Map data}) async {
    return await _apiService.postResponse(endPoint: "register", data: data);
  }
}
