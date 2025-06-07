import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text_widget.dart';
import 'order_tracking_portreit_view.dart';
import 'order_tracking_landscape_view.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

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
        title: CustomTextWidget(
          text: "Order Tracking",
          fontSize:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 24
                  : 15,
          fontWeight: FontWeight.bold,
          color: const Color(0xff204F38),
        ),
      ),
      body: SingleChildScrollView(
        child:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? const OrderTrackingPortraitView()
                : const OrderTrackingLandScapeView(),
      ),
    );
  }
}
