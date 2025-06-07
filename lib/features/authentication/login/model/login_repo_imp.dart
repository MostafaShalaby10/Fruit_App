import 'package:task_one/core/networking/api_service.dart';
import 'package:task_one/features/authentication/login/model/login_repo_interface.dart';

class LoginRepoImp implements LoginRepoInterface {
  final ApiService _apiService;
  LoginRepoImp(this._apiService);
  @override
  Future login(String email, String password) async {
    return await _apiService.postResponse(
      endPoint: "login",
      data: {"phone_email": email, "password": password},
    );
  }
}
