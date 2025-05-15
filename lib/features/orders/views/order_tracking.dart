import 'package:flutter/material.dart';
import 'order_tracking_portreit_view.dart';
import 'order_tracking_landscape_view.dart';
class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return const OrderTrackingPortraitView();
    } else {
      return const OrderTrackingLandScapeView();
    }
  


    }
}
