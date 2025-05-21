import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text_widget.dart';
import 'checkout_landscape_view.dart';
import 'checkout_portreit_view.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        centerTitle: true,
        title:  CustomTextWidget(
          text: "Checkout",
 fontSize:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 24
                  : 15,          fontWeight: FontWeight.bold,
          color: Color(0xff204F38),
        ),
      ),
      body: MediaQuery.of(context).orientation == Orientation.portrait?const PortreitView():const LandScapeView(),
    );
  }
}
