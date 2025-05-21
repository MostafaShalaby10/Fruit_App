import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text_widget.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget(
          text: "Fruit Market",
          fontSize:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 24
                  : 15,
          fontWeight: FontWeight.bold,
          color: Color(0xff204F38),
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
    );
  }
}
