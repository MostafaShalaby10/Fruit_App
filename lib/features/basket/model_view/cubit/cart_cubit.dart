import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_one/features/basket/model/repos/basket_repo_interface.dart';
import 'package:task_one/features/basket/model/repos/bassket_repo_imp.dart';
import 'package:task_one/features/orders/model/models/add_order_request_model/add_order_request_model.dart';
import 'package:task_one/features/orders/model/models/add_order_request_model/product.dart';

import '../../../../core/utils/shared_prefrences.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final BasketRepoInterface _basketRepoInterface;
  CartCubit(this._basketRepoInterface) : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  List cart = [];
  dynamic totalPrice = 0;
  dynamic shippingCharges = 1.5;
  Future addToCart({required Map productData}) async {
    emit(LoadingAddToCartState());
     await getCart();
    if (!(cart.any((map) => map.toString() == productData.toString()))) {
      cart.add(productData);
    }
    log(cart.toString());
    String data = jsonEncode(cart);
    await SharedPrefs.saveData(key: "cart", value: data);
    emit(SuccessfullyAddToCartState());
  }

  Future<List> getCart() async {
    totalPrice = 0;
    emit(LoadingGetCartState());
    String? getData = await SharedPrefs.getData(key: "cart");
    getData ??= "[]";
        cart = jsonDecode(getData);
    log(cart.toString());
    for(var element in cart){
      totalPrice +=element['item_price'] * element['quantity'];
    }
      log(totalPrice.toString());
    totalPrice = totalPrice.toStringAsFixed(2);
    totalPrice = double.parse(totalPrice);
    emit(SuccessfullyGetCartState());
    return cart;
  }
  void increaseCount(int index)async{
    log(cart[index].toString());
    cart[index]['quantity']+=1;
    totalPrice += cart[index]['item_price'];
    totalPrice = totalPrice.toStringAsFixed(2);
    totalPrice = double.parse(totalPrice);

    await SharedPrefs.saveData(key: "cart", value: jsonEncode(cart));
    
    emit(ChangeCounterState());
  }
  void decreaseCount(int index)async{
    if(cart[index]['quantity']>1){
    cart[index]['quantity']-=1;
    totalPrice -= cart[index]['item_price'];
    totalPrice = totalPrice.toStringAsFixed(2);
    totalPrice = double.parse(totalPrice);
    await SharedPrefs.saveData(key: "cart", value: jsonEncode(cart));
  }
    emit(ChangeCounterState());

  }
  void deleteItem(int index)async{
    cart.removeAt(index);
    await SharedPrefs.saveData(key: "cart", value: jsonEncode(cart));
await getCart();
  }



  late AddOrderRequestModel addOrderRequestModel;
  Future createOrder({required double totalPrice ,required List<Product> products}) async {
    emit(LoadingCreateOrderState());
    addOrderRequestModel = AddOrderRequestModel(
      orderTotalPrice: totalPrice,
      products: products,
    );
    await _basketRepoInterface
        .createOrder(addOrderRequestModel.toJson())
        .then((value) {
      emit(SuccessfullyCreateOrderState(value.data["message"]));
    })
        .catchError((error) {
      log(error.toString());
      emit(ErrorCreateOrderState(error.toString()));
    });
  }


}
