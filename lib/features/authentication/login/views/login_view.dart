import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/utils/service_locator.dart';
import 'package:task_one/core/widgets/nav_bar_widget.dart';
import 'package:task_one/features/authentication/login/model/login_repo_imp.dart';
import 'package:task_one/features/authentication/login/model_view/cubit/login_cubit.dart';
import 'package:task_one/features/authentication/signup/views/signup_view.dart';

import '../../../../core/services/colors/colors.dart';
import '../../../../core/widgets/custom_button_widget.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/phone_field.dart';
import '../../veify_phone/views/verify_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<LoginRepoImp>()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        body: SingleChildScrollView(
          child:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? const PortreitView()
                  : const LandScapeView(),
        ),
      ),
    );
  }
}

class PortreitView extends StatelessWidget {
  const PortreitView({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SuccessfullyLoginState) {
          if (state.status) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const NavigationBarWidget(),
              ),
              (route) => false,
            );
          }
        } else if (state is ErrorLoginState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
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
                      child: CustomTextFormField(
                        hintText: "Email",
                        controller: LoginCubit.get(context).emailController,
                      ),
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
                      child: CustomTextFormField(
                        hintText: "Password",
                        controller: LoginCubit.get(context).passwordController,
                      ),
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
              state is! LoadingLoginState
                  ? SizedBox(
                    width: 347.w,
                    height: 51.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: CustomButtonWidget(
                        function: () {
                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const VerifyView(),
                          //   ),
                          //   (route) => false,
                          // );
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).login();
                          }
                        },
                        text: "Login",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                  : const Center(child: CircularProgressIndicator()),
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
                          MaterialPageRoute(
                            builder: (context) => const SignupView(),
                          ),
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
          ),
        );
      },
    );
  }
}

class LandScapeView extends StatelessWidget {
  const LandScapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.h),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomTextWidget(
                        textAlign: TextAlign.center,
                        text: "\nFruit Market",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 21.h, bottom: 53.h),
                        child: const CustomTextWidget(
                          textAlign: TextAlign.center,
                          text: "Login to Wikala",
                          fontSize: 12,
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
                            fontSize: 8,
                            color: Color(0xff858D9A),
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            text: "*",
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

                      const Row(
                        children: [
                          CustomTextWidget(
                            text: "Password",
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
                        child: CustomTextFormField(
                          hintText: "Password",
                          fontSize: 9.sp,
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const CustomTextWidget(
                            textDecoration: TextDecoration.underline,
                            text: "Forget Password?",
                            fontSize: 9,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff004D8E),
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 60.h,
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
                            fontSize: 9,
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
              SizedBox(width: 100.w),
              const CustomTextWidget(
                text: "Don’t have an account?",
                fontSize: 9,
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
                  fontSize: 9,
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
