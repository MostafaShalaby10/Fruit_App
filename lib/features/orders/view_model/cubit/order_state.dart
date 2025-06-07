part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class LoadingCreateOrderState extends OrderState {}

final class SuccessfullyCreateOrderState extends OrderState {
  final String message;

  SuccessfullyCreateOrderState(this.message);
}

final class ErrorCreateOrderState extends OrderState {
  final String message;
  ErrorCreateOrderState(this.message);
}

final class LoadingGetOrdersState extends OrderState {}

final class SuccessfullyGetOrdersState extends OrderState {
  // final AddOrderResponseModel data;
  // SuccessfullyGetOrdersState(this.data);
}

final class ErrorGetOrdersState extends OrderState {
  final String message;
  ErrorGetOrdersState(this.message);
}
