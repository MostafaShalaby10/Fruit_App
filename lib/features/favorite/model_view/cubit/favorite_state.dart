part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class LoadingAddFavoriteState extends FavoriteState {}

final class SuccessfullyAddFavoriteState extends FavoriteState {
  final bool result;
  final String message;
  SuccessfullyAddFavoriteState({required this.result, required this.message});
}

final class ErrorAddFavoriteState extends FavoriteState {
  final String error;
  ErrorAddFavoriteState(this.error);
}

final class LoadingGetFavoriteState extends FavoriteState {}

final class SuccessfullyGetFavoriteState extends FavoriteState {}

final class ErrorGetFavoriteState extends FavoriteState {
  final String error;
  ErrorGetFavoriteState(this.error);
}

