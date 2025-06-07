part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoadingLoginState extends LoginState {}

final class SuccessfullyLoginState extends LoginState {
  final String message;
  final bool status;
  SuccessfullyLoginState({required this.message, required this.status});
}

final class ErrorLoginState extends LoginState {
  final String error;

  ErrorLoginState(this.error);
}
