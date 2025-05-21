import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/widgets/phone_field.dart';
import 'package:task_one/features/OTP/views/verification.dart';

import '../../../../core/services/colors/colors.dart';
import '../../../../core/widgets/custom_button_widget.dart';
import '../../../../core/widgets/custom_text_widget.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? const PortreitView()
                : const LandScapeView(),
      ),
    );
  }
}

class PortreitView extends StatelessWidget {
  const PortreitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.black.withOpacity(.25),
                    ),
                  ],
                ),
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
                  MaterialPageRoute(builder: (context) => const Verification()),
                  (route) => false,
                );
              },
              text: "Submit",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class LandScapeView extends StatelessWidget {
  const LandScapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50.h, left: 20.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const CustomTextWidget(
                    textAlign: TextAlign.center,
                    text: "Fruit Market",
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 21.h, bottom: 28.h),
                    child: const CustomTextWidget(
                      textAlign: TextAlign.center,
                      text: "Enter your Number",
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  spacing: 20.h,

                  children: [
                    const Row(
                      children: [
                        CustomTextWidget(
                          text: "Phone Number",
                          fontSize: 8,
                          color: Color(0xff858D9A),
                          fontWeight: FontWeight.normal,
                        ),
                        CustomTextWidget(
                          text: " *",
                          fontSize: 8,
                          color: Color(0xffED692E),
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),

                    Container(
                      height: 80.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(.25),
                          ),
                        ],
                      ),
                      child: PhoneField(
                        hintText: "Mobile Number",
                        fontSize: 9.sp,
                      ),
                    ),
                    SizedBox(
                      width: 347.w,
                      height: 60.h,
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
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
