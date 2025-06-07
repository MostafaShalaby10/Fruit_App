import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_one/features/authentication/signup/model/models/signup_request_model.dart';
import 'package:task_one/features/authentication/signup/model/signup_repo_interface.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepoInterface _signupRepoInterface;
  SignupCubit(this._signupRepoInterface) : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late SignupRequestModel signupRequestModel;

  Future createAnAccount() async {
    emit(LoadingCreateAnAccountState());
    signupRequestModel = SignupRequestModel(
      name: nameController.text,
      mobile: mobileController.text,
      email: emailController.text,
      password: passwordController.text,
      c_password: passwordController.text,
      // onesignal_id: onesignal_id,
    );

    _signupRepoInterface
        .signupRequest(data: signupRequestModel.toJson())
        .then((value) {
          nameController.clear();
          mobileController.clear();
          emailController.clear();
          passwordController.clear();
          emit(SuccessfullyCreateAnAccountState(value.message));
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorCreateAnAccountState(error.toString()));
        });
  }
}
