import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_one/features/contact_us/model/repos/contact_repo_interface.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final ContactRepoInterface _contactRepoInterface;

  ContactCubit(this._contactRepoInterface) : super(ContactInitial());
  static ContactCubit get(context) => BlocProvider.of(context);

  Map data = {};

  Future getAbout() async {
    data.clear();
    emit(LoadingGetAboutAndTermsState());
    return _contactRepoInterface
        .getAbout()
        .then((value) {
          data = value.data["data"];
          emit(SuccessfullyGetAboutAndTermsState());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetAboutAndTermsState(error.toString()));
        });
  }

  Future getTerms() async {
    data.clear();
    emit(LoadingGetAboutAndTermsState());
    return _contactRepoInterface
        .getTerms()
        .then((value) {
          data = value.data["data"];

          emit(SuccessfullyGetAboutAndTermsState());
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetAboutAndTermsState(error.toString()));
        });
  }
}
