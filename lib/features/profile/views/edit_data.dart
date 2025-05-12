import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/colors/colors.dart';
import 'package:task_one/core/widgets/custom_text_widget.dart';

import '../../../core/widgets/custom_button_widget.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/phone_field.dart';

class EditData extends StatelessWidget {
  const EditData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 86.h, left: 49.w, bottom: 46.h),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 165.w, right: 175.w, bottom: 18.h),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 90.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: primaryColor),
                    ),
                  ),
                  Positioned(
                    bottom: -8.h,
                    right: -20.w,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: primaryColor,
                        size: 31,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 121.w, bottom: 34.h),
              child: const CustomTextWidget(
                text: "Welcome, Ahmed",
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                children: [
                  const Row(
                    children: [
                      CustomTextWidget(
                        text: "Full name",
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

                    child: const CustomTextFormField(
                      hintText: "First and Last Name",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32.h, left: 40.w, right: 40.w),
              child: Column(
                children: [
                  const Row(
                    children: [
                      CustomTextWidget(
                        text: "Phone Number with Whatsapp *",
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
              padding: EdgeInsets.only(
                top: 23.h,
                left: 40.w,
                right: 40.w,
                bottom: 40.h,
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      CustomTextWidget(
                        text: "Password",
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

                    child: const CustomTextFormField(hintText: "Password"),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 239.h),
              child: SizedBox(
                width: 347.w,
                height: 51.h,
                child: CustomButtonWidget(
                  function: () {},

                  text: "Update",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
