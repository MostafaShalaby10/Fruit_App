import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/utils/service_locator.dart';
import 'package:task_one/features/orders/view_model/cubit/order_cubit.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../model/repos/order_repo_imp.dart';
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
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return BlocProvider(
      create: (context) => OrderCubit(getIt<OrderRepoImp>())..getOrders(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          centerTitle: true,
          title: CustomTextWidget(
            text: "My Orders",
            fontSize:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 24
                    : 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xff204F38),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 24.h, left: 13.w, right: 16.w),
          child:
              isLandscape
                  ? LandScapeView(status: status)
                  : PortreitView(status: status),
        ),
      ),
    );
  }
}
