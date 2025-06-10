part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class LoadingAddToCartState extends CartState {}

final class SuccessfullyAddToCartState extends CartState {}


final class LoadingGetCartState extends CartState {}

final class SuccessfullyGetCartState extends CartState {}


