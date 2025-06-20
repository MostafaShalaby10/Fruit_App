part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class LoadingCreateAnAccountState extends SignupState {}

final class SuccessfullyCreateAnAccountState extends SignupState {
  final String message;
  final bool status;
  SuccessfullyCreateAnAccountState(this.message, this.status);
}

final class ErrorCreateAnAccountState extends SignupState {
  final String message;
  ErrorCreateAnAccountState(this.message);
}
