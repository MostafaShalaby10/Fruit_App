import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_one/core/utils/shared_prefrences.dart';
import 'package:task_one/features/basket/model_view/cubit/cart_cubit.dart';
import 'package:task_one/features/favorite/model/repos/fav_repo_interface.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavRepoInterface _favRepoInterface;
  final CartCubit _cartCubit;
  FavoriteCubit(this._favRepoInterface, this._cartCubit)
    : super(FavoriteInitial());
  static FavoriteCubit get(context) => BlocProvider.of(context);

  List favorites = [];
  Future addFavorite({required int id}) async {
    emit(LoadingAddFavoriteState());
    _favRepoInterface
        .addFav(id)
        .then((value) async {
          await getFavorite();
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorAddFavoriteState(error.toString()));
        });
  }

  Future getFavorite() async {
    favorites.clear();
    emit(LoadingGetFavoriteState());
    await _favRepoInterface
        .getAllFav()
        .then((value) {
          favorites = value.data["data"];
          emit(SuccessfullyGetFavoriteState());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetFavoriteState(error.toString()));
        });
  }

  Future addToCart({required Map productData}) async {
    _cartCubit.addToCart(productData: productData);
  }
}
