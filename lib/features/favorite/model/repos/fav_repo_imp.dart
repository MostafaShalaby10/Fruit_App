import 'package:task_one/core/networking/api_service.dart';
import 'package:task_one/core/utils/shared_prefrences.dart';

import 'fav_repo_interface.dart';

class FavRepoImp implements FavRepoInterface {
  final ApiService _apiService;
  FavRepoImp(this._apiService);

  @override
  Future addFav(int id) async {
    var token = await SharedPrefs.getData(key: "token");
    return await _apiService.postResponse(
      endPoint: "user_favorite",
      data: {"favo_id": id},
      headers: {'Authorization': 'Bearer $token'},
    );
  }

  @override
  Future getAllFav() async {
    var token = await SharedPrefs.getData(key: "token");

    return await _apiService.getResponse(
      endPoint: "user_favorite/t/ar",

      headers: {'Authorization': 'Bearer $token'},
    );
  }
}
