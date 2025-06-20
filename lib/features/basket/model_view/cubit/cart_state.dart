part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class LoadingAddToCartState extends CartState {}

final class SuccessfullyAddToCartState extends CartState {}


final class LoadingGetCartState extends CartState {}

final class SuccessfullyGetCartState extends CartState {}
final class ChangeCounterState extends CartState {}



final class LoadingCreateOrderState extends CartState {}

final class SuccessfullyCreateOrderState extends CartState {
  final String message;

  SuccessfullyCreateOrderState(this.message);
}

final class ErrorCreateOrderState extends CartState {
  final String message;
  ErrorCreateOrderState(this.message);
}