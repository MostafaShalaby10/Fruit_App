import 'package:task_one/core/networking/api_service.dart';
import 'package:task_one/core/utils/shared_prefrences.dart';
import 'package:task_one/features/profile/model/repos/profile_repo_interface.dart';

class ProfileRepoImp implements ProfileRepoInterface {
  final ApiService _apiService;
  ProfileRepoImp(this._apiService);

  @override
  Future updateProfile({required dynamic data}) async {
    var token = await SharedPrefs.getData(key: "token");

    return await _apiService.postResponse(
      endPoint: "update_profile/1",
      data: data,
      headers: {'Authorization': 'Bearer $token'},
    );
  }

  @override
  Future getProfile() async {
    var token = await SharedPrefs.getData(key: "token");
    return await _apiService.getResponse(
      endPoint: "profile",
      headers: {'Authorization': 'Bearer $token'},
    );
  }
}
