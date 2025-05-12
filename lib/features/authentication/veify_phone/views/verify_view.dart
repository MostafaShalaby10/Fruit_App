import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/widgets/phone_field.dart';
import 'package:task_one/features/OTP/views/verification.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/widgets/custom_button_widget.dart';
import '../../../../core/widgets/custom_text_widget.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: 430.w,
        height: 64.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/home_icon.png"),
            Image.asset("assets/category_icon.png"),
            Image.asset("assets/cart_icon.png"),
            Image.asset("assets/favorite_icon.png"),
            Image.asset("assets/more_icon.png"),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 86.h, left: 49.w, bottom: 51.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
          const CustomTextWidget(
            textAlign: TextAlign.center,
            text: "Fruit Market",
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 21.h,
              bottom: 28.h,
              right: 99.w,
              left: 78.w,
            ),
            child: const CustomTextWidget(
              textAlign: TextAlign.center,
              text: "Enter your Number",
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              children: [
                const Row(
                  children: [
                    CustomTextWidget(
                      text: "Phone Number with Whatsapp",
                      fontSize: 14,
                      color: Color(0xff858D9A),
                      fontWeight: FontWeight.normal,
                    ),
                    CustomTextWidget(
                      text: " *",
                      fontSize: 14,
                      color: Color(0xffED692E),
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),

                Material(
                  borderRadius: BorderRadius.circular(25.r),
                  elevation: 5.0,

                  child: const PhoneField(hintText: "Mobile Number"),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 48.h, right: 41.w, left: 42.w),
            child: SizedBox(
              width: 347.w,
              height: 51.h,
              child: CustomButtonWidget(
                function: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Verification(),
                    ),
                    (route) => false,
                  );
                },
                text: "Submit",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
