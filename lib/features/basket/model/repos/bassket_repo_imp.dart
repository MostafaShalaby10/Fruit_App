import 'package:task_one/core/networking/api_service.dart';
import 'package:task_one/core/utils/shared_prefrences.dart';
import 'package:task_one/features/basket/model/repos/basket_repo_interface.dart';

class BassketRepoImp implements BasketRepoInterface{
  final ApiService _apiService;
  BassketRepoImp(this._apiService);

  @override
  Future createOrder(Map<String, dynamic> order) async {
    var token = await SharedPrefs.getData(key: "token");
    return await _apiService.postResponse(
      endPoint: "user_orders",
      data: order,
      headers: {"Authorization": "Bearer$token"},
    );
  }
}