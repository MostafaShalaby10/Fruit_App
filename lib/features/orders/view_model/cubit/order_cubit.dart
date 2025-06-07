import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_one/features/orders/model/models/add_order_request_model/add_order_request_model.dart';
import 'package:task_one/features/orders/model/repos/order_repo_interface.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepoInterface _orderRepoInterface;
  OrderCubit(this._orderRepoInterface) : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);

  late AddOrderRequestModel addOrderRequestModel;
  Future createOrder() async {
    emit(LoadingCreateOrderState());
    addOrderRequestModel = AddOrderRequestModel(
      address: "",
      deliveryTime: "",
      orderTotalPrice: 10,
      paymentType: "",
      products: [],
    );
    await _orderRepoInterface
        .createOrder(addOrderRequestModel.toJson())
        .then((value) {
          emit(SuccessfullyCreateOrderState(value.data["message"]));
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorCreateOrderState(error.toString()));
        });
  }

  List orders = [];
  Future getOrders() async {
    orders.clear();
    emit(LoadingGetOrdersState());
    await _orderRepoInterface
        .getOrders()
        .then((value) {
         
          for (var element in value.data["data"]) {
            orders.add(element);
          }
        
          emit(
            SuccessfullyGetOrdersState(
              // AddOrderResponseModel.fromJson(value.data),
            ),
          );
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetOrdersState(error.toString()));
        });
  }
}
