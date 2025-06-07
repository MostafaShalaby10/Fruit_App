import 'package:task_one/core/networking/api_service.dart';
import 'package:task_one/core/utils/shared_prefrences.dart';
import 'package:task_one/features/orders/model/repos/order_repo_interface.dart';

class OrderRepoImp implements OrderRepoInterface {
  final ApiService _apiService;
  OrderRepoImp(this._apiService);
  @override
  Future createOrder(Map<String, dynamic> order) async {
    var token = await SharedPrefs.getData(key: "token");
    return await _apiService.postResponse(
      endPoint: "user_orders",
      data: order,
      headers: {"Authorization": "Bearer$token"},
    );
  }
  @override
  Future getOrders() async{
   var token = await SharedPrefs.getData(key: "token");
    return await _apiService.getResponse(
      endPoint: "user_orders/t/ar",
      headers: {"Authorization": "Bearer $token"},
    );    
  }
}
