part of 'contact_cubit.dart';

@immutable
sealed class ContactState {}

final class ContactInitial extends ContactState {}

final class LoadingGetAboutAndTermsState extends ContactState {}

final class SuccessfullyGetAboutAndTermsState extends ContactState {}

final class ErrorGetAboutAndTermsState extends ContactState {
  final String error;
  ErrorGetAboutAndTermsState(this.error);
}
