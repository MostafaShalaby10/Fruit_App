import 'package:flutter/material.dart';
import 'product_landscape_view.dart';
import 'product_portreit_view.dart';
class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
 
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return const PortreitView();
    } else {
      return const LandScapeView();
    }
  

     }
}

