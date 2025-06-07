import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_one/core/utils/service_locator.dart';
import 'package:task_one/features/profile/model/repos/profile_repo_imp.dart';
import 'package:task_one/features/profile/view_model/cubit/profile_cubit.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../contact_us/model/repos/contact_repo_imp.dart';
import '../../contact_us/model_view/cubit/contact_cubit.dart';
import 'profile_landscape_view.dart';
import 'profile_portreit_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Profile",
      "My Orders",
      "Favorite",
      "Language",
      "Support",
      "Terms & Conditions",
      "About Us",
    ];
    List<String> icons = [
      "assets/user.png",
      "assets/category_icon.png",
      "assets/favorite_icon.png",
      "assets/languages.png",
      "assets/headphone.png",
      "assets/money.png",
      "assets/info.png",
    ];
    return  BlocProvider(
          create:
              (context) => ProfileCubit(getIt<ProfileRepoImp>())..getProfile(),
        
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomTextWidget(
            text: "Fruit Market",
            fontSize:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 24
                    : 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xff204F38),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? PortreitView(titles: titles, icons: icons)
                : LandScapeView(titles: titles, icons: icons),
      ),
    );
  }
}
