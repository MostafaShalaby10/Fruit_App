import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text_widget.dart';
import 'basket_landscape_view.dart';
import 'basket_portreit_view.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
        leading: IconButton(
          onPressed: () {
      },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        centerTitle: true,
        title: const CustomTextWidget(
          text: "Basket",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xff204F38),
        ),
      ),
    
    resizeToAvoidBottomInset: false,
    body: SingleChildScrollView(
      child: MediaQuery.of(context).orientation == Orientation.portrait?PortreitView():LandScapeView(),
   ));
  }
}
