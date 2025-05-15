import 'package:flutter/material.dart';

import 'home_portreit_view.dart';
import 'home_landscape_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool searchClicked = false;
  List<String> cards = [
    "assets/restruants.png",
    "assets/farm.png",
    "assets/coffe.png",
    "assets/pharmcy.png",
  ];
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return PortreitView(cards: cards);
    } else {
      return LandScapeView(cards: cards);
    }
  }
}
