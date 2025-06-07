import 'package:task_one/core/networking/api_service.dart';
import 'package:task_one/features/home/model/repos/home_repo_interface.dart';

class HomeRepoImp extends HomeRepoInterface {
  final ApiService _apiService;
  HomeRepoImp(this._apiService);
  @override
  Future getCategories() async {
    return await _apiService.getResponse(
      endPoint: "categories/get_with_sub/ar/0/0",
    );
  }
}
