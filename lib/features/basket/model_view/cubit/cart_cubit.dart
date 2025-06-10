import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/shared_prefrences.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  List cart = [];

  Future addToCart({required Map productData}) async {
    emit(LoadingAddToCartState());
     await getCart();
    cart.add(productData);
    log(cart.toString());
    String data = jsonEncode(cart);
    await SharedPrefs.saveData(key: "cart", value: data);
    emit(SuccessfullyAddToCartState());
  }

  Future<List> getCart() async {
    emit(LoadingGetCartState());
    String? getData = await SharedPrefs.getData(key: "cart");
    getData ??= "[]";
        cart = jsonDecode(getData);
    log(getData);
    emit(SuccessfullyGetCartState());
    return cart;
  }
}
