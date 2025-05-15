import 'package:flutter/material.dart';
import 'order_view_landscape.dart';
import 'order_view_portreit.dart';
class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> status = [
      "Delivering",
      "Finished",
      "Canceled",
      "Working",
      "Delivered",
      "New",
    ];
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return PortreitView(status: status);
    } else {
      return LandScapeView(status: status);
    }
  }

}
