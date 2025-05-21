import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_button_widget.dart';
import '../../../core/widgets/custom_text_widget.dart';

class FailedView extends StatelessWidget {
  const FailedView({super.key});

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
          text: "Checkout",
          fontSize:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 24
                  : 11,
          fontWeight: FontWeight.bold,
          color: Color(0xff204F38),
        ),
      ),
      body:
          MediaQuery.of(context).orientation == Orientation.portrait
              ? const PortreitView()
              : const LandScapeView(),
    );
  }
}

class PortreitView extends StatelessWidget {
  const PortreitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 156.h, bottom: 46.h),
              child: Image.asset("assets/fail.png"),
            ),
            const CustomTextWidget(
              text: "OPS",
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xffFF4A4A),
            ),
            SizedBox(height: 11.h),
            const CustomTextWidget(
              text: "Error while confirming your payment/order",
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xff656565),
            ),
            SizedBox(height: 78.h),
            Container(
              // padding: EdgeInsets.all(10),
              width: 347.w,
              height:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 51.h
                      : 80.h,
              decoration: BoxDecoration(
                color: const Color(0xffFF4A4A),
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(.25),
                  ),
                ],
              ),
              child: CustomButtonWidget(
                color: const Color(0xffFF4A4A),
                text: "Back",
                function: () {
                  Navigator.pop(context);
                },
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}

class LandScapeView extends StatelessWidget {
  const LandScapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/fail.png"),

        Column(
          spacing: 20.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTextWidget(
              text: "OPS",
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xffFF4A4A),
            ),
            const CustomTextWidget(
              text: "Error while confirming your payment/order",
              fontSize: 9,
              fontWeight: FontWeight.w400,
              color: Color(0xff656565),
            ),
            Container(
              // padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * .3,
              decoration: BoxDecoration(
                color: const Color(0xffFF4A4A),
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(.25),
                  ),
                ],
              ),
              child: CustomButtonWidget(
                color: const Color(0xffFF4A4A),
                text: "Back",
                function: () {
                  Navigator.pop(context);
                },
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
