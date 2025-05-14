import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/widgets/custom_button_widget.dart';
import 'package:task_one/core/widgets/custom_text_form_field.dart';
import 'package:task_one/core/widgets/phone_field.dart';
import 'package:task_one/features/authentication/login/views/login_view.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/widgets/custom_text_widget.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 86.h, left: 49.w, bottom: 51.0),
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
                right: 104.w,
                left: 89.w,
                bottom: 59.h,
              ),
              child: const CustomTextWidget(
                textAlign: TextAlign.center,
                text: "Sign Up to Wikala",
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
              padding: EdgeInsets.only(
                top: 23.h,
                left: 40.w,
                right: 40.w,
                bottom: 41.h,
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

                    child: const CustomTextFormField(hintText: "Password"),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 347.w,
              height: 51.h,
              child: CustomButtonWidget(
                function: () {},

                text: "SignUp",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 39.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextWidget(
                  text: "Already have an account?",
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  },
                  child: const CustomTextWidget(
                    text: "Login",
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff004D8E),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
