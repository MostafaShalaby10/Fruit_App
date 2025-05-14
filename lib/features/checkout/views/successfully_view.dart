import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/widgets/custom_button_widget.dart';
import 'package:task_one/features/checkout/views/failed_view.dart';
import 'package:task_one/features/orders/views/order_tracking.dart';

import '../../../core/widgets/custom_text_widget.dart';

class SuccessfullyView extends StatelessWidget {
  const SuccessfullyView({super.key});

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
        title: const CustomTextWidget(
          text: "Checkout",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xff204F38),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 108.h, bottom: 55.h),
                child: Image.asset("assets/success.png"),
              ),
              const CustomTextWidget(
                text: "YOUR ORDER IS CONFIRMED!",
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xff204F38),
              ),
              SizedBox(height: 10.h),
              const CustomTextWidget(
                text: "Your order code: #243188",
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xff656565),
              ),
              const CustomTextWidget(
                text: "Thank you for choosing our products!",
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xff656565),
              ),
              SizedBox(height: 32.h),

              Container(
                // padding: EdgeInsets.all(10),
                width: 347.w,
                height: 51.h,
                decoration: BoxDecoration(
                  color: const Color(0xff204F38),
                  borderRadius: BorderRadius.circular(25.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.black.withOpacity(.25),
                    ),
                  ],
                ),
                child: CustomButtonWidget(
                  text: "Continue Shopping",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OrderTracking()),
                    );
                  },
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 22.h),

              Container(
                // padding: EdgeInsets.all(10),
                width: 347.w,
                height: 51.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(width: 0.w),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.black.withOpacity(.25),
                    ),
                  ],
                ),
                child: CustomButtonWidget(
                  color: Colors.white,
                  text: "Track Order",
                  textColor: const Color(0xff204F38),
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FailedView()),
                    );
                  },
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
