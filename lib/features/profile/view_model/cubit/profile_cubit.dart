import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_one/features/profile/model/model/update_data_request_model.dart';
import 'package:task_one/features/profile/model/model/user_date_model/user_date_model.dart';
import 'package:task_one/features/profile/model/repos/profile_repo_interface.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepoInterface _profileRepoInterface;
  ProfileCubit(this._profileRepoInterface) : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late UpdateDataRequestModel updateDataRequestModel;

  Future updateData() async {
    emit(LoadingUpdateDataState());
    updateDataRequestModel = UpdateDataRequestModel(
      name: nameController.text,
      email: emailController.text,
      mobile: phoneController.text,
      photo: file,
    );

    _profileRepoInterface
        .updateProfile(data: await updateDataRequestModel.toJson())
        .then((value) {
          emit(SuccessfullyUpdateDataState(message: value.data["message"]));
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorUpdateDataState(error.toString()));
        });
  }

  Map userData = {};
  Future getProfile() async {
    userData.clear();
    emit(LoadingGetDataState());
    return await _profileRepoInterface
        .getProfile()
        .then((value) {
          nameController.text = value.data!["data"]["name"];
          emailController.text = value.data!["data"]["email"];
          phoneController.text = value.data!["data"]["mobile"];
          userData = value.data["data"];
          emit(
            SuccessfullyGetDataState(),
          );
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetDataState(error.toString()));
        });
  }

  XFile? file;
  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // File selectedImage = File(image!.path);
      // print('Image selected: ${selectedImage.path}');
      file = image;
      emit(UploadPhoto());
    } else {
      print('No image selected');
      return null;
    }
  }
}
