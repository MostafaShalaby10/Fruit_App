import 'package:flutter/material.dart';
import 'checkout_landscape_view.dart';
import 'checkout_portreit_view.dart';
class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return const PortreitView();
    } else {
      return const LandScapeView();
    }
  }
}
