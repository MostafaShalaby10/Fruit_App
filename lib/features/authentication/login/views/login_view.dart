import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/features/authentication/signup/views/signup_view.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/widgets/custom_button_widget.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/phone_field.dart';
import '../../veify_phone/views/verify_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false,

        body: SingleChildScrollView(
          child:     MediaQuery.of(context).orientation == Orientation.portrait?const PortreitView():const LandScapeView(),
        )
     
    );
    
  }
}

class PortreitView extends StatelessWidget {
  const PortreitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
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
            left: 104.w,
            right: 119.w,
            bottom: 53.h,
          ),
          child: const CustomTextWidget(
            textAlign: TextAlign.center,
            text: "Login to Wikala",
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
                    text: "Phone Number with Whatsapp ",
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
          padding: EdgeInsets.symmetric(horizontal: 40.w),
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

        Padding(
          padding: EdgeInsets.only(top: 17.h, bottom: 21.h, right: 38.w),
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const CustomTextWidget(
                textDecoration: TextDecoration.underline,
                text: "Forget Password?",
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Color(0xff004D8E),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 347.w,
          height: 51.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: CustomButtonWidget(
              function: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const VerifyView()),
                  (route) => false,
                );
              },
              text: "Login",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 35.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextWidget(
                text: "Don’t have an account?",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupView()),
                  );
                },
                child: const CustomTextWidget(
                  text: "|Sign up",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff004D8E),
                ),
              ),
            ],
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
    return Padding(
      padding: EdgeInsets.only(left: 49.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 86.h, bottom: 20.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CustomTextWidget(
                        textAlign: TextAlign.center,
                        text: "Fruit Market",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 21.h, bottom: 53.h),
                        child: const CustomTextWidget(
                          textAlign: TextAlign.center,
                          text: "Login to Wikala",
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 10.h,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Row(
                        children: [
                          CustomTextWidget(
                            textAlign: TextAlign.start,
                            text: "Phone Number",
                            fontSize: 10,
                            color: Color(0xff858D9A),
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            text: "*",
                            fontSize: 10,
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
                          fontSize: 11.sp,
                        ),
                      ),

                      const Row(
                        children: [
                          CustomTextWidget(
                            text: "Password",
                            fontSize: 10,
                            color: Color(0xff858D9A),
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            text: " *",
                            fontSize: 10,
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
                        child: CustomTextFormField(
                          hintText: "Password",
                          fontSize: 11.sp,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(right: 38.w),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const CustomTextWidget(
                              textDecoration: TextDecoration.underline,
                              text: "Forget Password?",
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff004D8E),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 347.w,
                        height: 60.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: CustomButtonWidget(
                            function: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VerifyView(),
                                ),
                                (route) => false,
                              );
                            },
                            text: "Login",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextWidget(
                text: "Don’t have an account?",
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupView()),
                  );
                },
                child: const CustomTextWidget(
                  text: "|Sign up",
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff004D8E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
