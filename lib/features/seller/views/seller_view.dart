import 'package:flutter/material.dart';

import 'seller_portreit_view.dart';
import 'seller_landscape_view.dart';
class SellerView extends StatelessWidget {
  const SellerView({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return const PortreitView();
    } else {
      return const LandScapeView();
    }
  }
}
