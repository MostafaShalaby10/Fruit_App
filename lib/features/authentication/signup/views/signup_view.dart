import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/utils/service_locator.dart';
import 'package:task_one/core/widgets/custom_button_widget.dart';
import 'package:task_one/core/widgets/custom_text_form_field.dart';
import 'package:task_one/core/widgets/phone_field.dart';
import 'package:task_one/features/authentication/login/views/login_view.dart';
import 'package:task_one/features/authentication/signup/model/signup_repo_imp.dart';
import 'package:task_one/features/authentication/signup/view_model/cubit/signup_cubit.dart';

import '../../../../core/services/colors/colors.dart';
import '../../../../core/widgets/custom_text_widget.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<SignupRepoImp>()),
      child: Scaffold(
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
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SuccessfullyCreateAnAccountState) {
          if (state.status) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
              (route) => false,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                
                content: CustomTextWidget(
                  color: Colors.white,

                  text: "تم انشاء حساب",
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          } else if (!state.status) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: CustomTextWidget(
                  color: Colors.white,
                  text: state.message,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }
        } else if (state is ErrorCreateAnAccountState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
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
                      child: CustomTextFormField(
                        hintText: "First and Last Name",
                        controller: SignupCubit.get(context).nameController,
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
                          text: "Email",
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
                        controller: SignupCubit.get(context).emailController,
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

                      child: PhoneField(
                        hintText: "Mobile Number",

                        controller: SignupCubit.get(context).mobileController,
                      ),
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

                      child: CustomTextFormField(
                        hintText: "Password",
                        controller: SignupCubit.get(context).passwordController,
                      ),
                    ),
                  ],
                ),
              ),
              state is! LoadingCreateAnAccountState
                  ? SizedBox(
                    width: 347.w,
                    height: 51.h,
                    child: CustomButtonWidget(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          SignupCubit.get(context).createAnAccount();
                        }
                      },

                      text: "SignUp",
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  : const Center(child: CircularProgressIndicator()),
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
        );
      },
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
          padding: EdgeInsets.only(top: 30.h, left: 30.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Column(
                  children: [
                    const CustomTextWidget(
                      textAlign: TextAlign.center,
                      text: "Fruit Market",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 21.h, bottom: 59.h),
                      child: const CustomTextWidget(
                        textAlign: TextAlign.center,
                        text: "Sign Up to Wikala",
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
                  children: [
                    const Row(
                      children: [
                        CustomTextWidget(
                          text: "Full name",
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
                        hintText: "First and Last Name",
                        fontSize: 9.sp,
                      ),
                    ),
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
                    SizedBox(height: 10.h),

                    SizedBox(
                      height: 60.h,
                      child: CustomButtonWidget(
                        function: () {},

                        text: "SignUp",
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
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
              text: "Already have an account?",
              fontSize: 9,
              fontWeight: FontWeight.normal,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              child: const CustomTextWidget(
                text: "Login",
                fontSize: 9,
                fontWeight: FontWeight.normal,
                color: Color(0xff004D8E),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
