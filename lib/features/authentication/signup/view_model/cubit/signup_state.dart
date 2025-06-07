part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class LoadingCreateAnAccountState extends SignupState {}

final class SuccessfullyCreateAnAccountState extends SignupState {
  final String message;
  SuccessfullyCreateAnAccountState(this.message);
}

final class ErrorCreateAnAccountState extends SignupState {
  final String message;
  ErrorCreateAnAccountState(this.message);
}
