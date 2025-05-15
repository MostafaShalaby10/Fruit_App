import 'package:flutter/material.dart';
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
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return PortreitView(titles: titles, icons: icons);
    } else {
      return LandScapeView(titles: titles, icons: icons);
    }
  }
}
