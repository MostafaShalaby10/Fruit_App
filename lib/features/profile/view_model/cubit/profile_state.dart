part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class LoadingUpdateDataState extends ProfileState {}

final class SuccessfullyUpdateDataState extends ProfileState {
  final String message;

  SuccessfullyUpdateDataState({required this.message});
}

final class ErrorUpdateDataState extends ProfileState {
  final String error;
  ErrorUpdateDataState(this.error);
}

final class LoadingGetDataState extends ProfileState {}

final class SuccessfullyGetDataState extends ProfileState {
//   final UserDateModel data;

//   SuccessfullyGetDataState({required this.data});
// }
}

final class ErrorGetDataState extends ProfileState {
  final String error;
  ErrorGetDataState(this.error);
}
final class UploadPhoto extends ProfileState {}
