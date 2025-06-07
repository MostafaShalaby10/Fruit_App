
abstract class OrderRepoInterface {
  Future createOrder(Map<String, dynamic> order);
  Future getOrders();

}