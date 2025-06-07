import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_one/features/home/model/models/categories_response_model/categories_response_model.dart';
import 'package:task_one/features/home/model/repos/home_repo_interface.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoInterface _homeRepoInterface;
  HomeCubit(this._homeRepoInterface) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  List categoriesData = [];
  Future getCategories() async {
    categoriesData.clear();
    emit(LoadingGetCategoriesState());
    _homeRepoInterface
        .getCategories()
        .then((value) {
   
          categoriesData = value.data!["data"];
          emit(
            SuccessfullyGetCategoriesState(
              CategoriesResponseModel.fromJson(value.data!),
            ),
          );
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetCategoriesState(error.toString()));
        });
  }
}
