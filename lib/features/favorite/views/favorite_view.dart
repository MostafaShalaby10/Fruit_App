import 'package:flutter/material.dart';
import 'favorite_landscape_view.dart';
import 'favorite_portreit_view.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return const PortreitView();
    } else {
      return const LandScapeView();
    }
  }
}
