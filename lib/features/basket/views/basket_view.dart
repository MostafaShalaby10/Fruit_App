import 'package:flutter/material.dart';
import 'basket_landscape_view.dart';
import 'basket_portreit_view.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return const PortreitView();
    } else {
      return const LandScapeView();
    }
  }
}
