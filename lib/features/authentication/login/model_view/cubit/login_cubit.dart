import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_one/core/utils/shared_prefrences.dart';
import 'package:task_one/features/authentication/login/model/login_repo_interface.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepoInterface _loginRepoInterface;
  LoginCubit(this._loginRepoInterface) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future login() async {
    emit(LoadingLoginState());
    return await _loginRepoInterface
        .login(emailController.text, passwordController.text)
        .then((value) async {
        
          if (value.data["status"] == true) {
            await SharedPrefs.saveData(
              key: "token",
              value: value.data["data"]["token"],
            );
          }
          emit(
            SuccessfullyLoginState(
              status: value.data["status"],
              message: value.data["message"],
            ),
          );
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorLoginState(error.toString()));
        });
  }
}
