part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadingGetCategoriesState extends HomeState {}

final class SuccessfullyGetCategoriesState extends HomeState {
  final CategoriesResponseModel data;
  SuccessfullyGetCategoriesState(this.data);
}

final class ErrorGetCategoriesState extends HomeState {
  final String error;
  ErrorGetCategoriesState(this.error);
}
