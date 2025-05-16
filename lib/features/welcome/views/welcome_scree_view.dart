import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/colors/colors.dart';
import 'package:task_one/core/widgets/custom_text_widget.dart';
import 'package:task_one/features/authentication/login/views/login_view.dart';
import 'package:task_one/features/contact_us/view/terms_view.dart';

class WelcomeScreeView extends StatelessWidget {
  const WelcomeScreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? const PortraitView()
                  : const LandScapeView(),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.text,
    required this.icon,
    this.color,
    this.textColor,
    required this.function,
  });
  final String text;
  final Widget icon;
  final Color? color;
  final Color? textColor;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.w, right: 48.w, bottom: 21.h),
      child: InkWell(
        onTap: function,
        child: Container(
          height: 51.h,
          padding: const EdgeInsets.all(10),
          width: 357.w,
          decoration: BoxDecoration(
            color: color ?? Colors.transparent,

            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(color: const Color(0xff656665)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10.w,
            children: [
              icon,

              CustomTextWidget(
                text: text,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: textColor ?? Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PortraitView extends StatelessWidget {
  const PortraitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 36.w, bottom: 61.h),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              padding: EdgeInsets.only(left: 37.w),
              onPressed: () {},
              icon: const Icon(Icons.close),
            ),
          ),
        ),
        const Center(
          child: CustomTextWidget(
            textAlign: TextAlign.center,
            text: "Fruit Market",
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 21.h, bottom: 52.h),
          child: const CustomTextWidget(
            textAlign: TextAlign.center,
            text: "Welcome to Our app",
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        CustomContainer(
          function: () {},
          text: 'Sign in with Phone Number',
          icon: const Icon(Icons.phone),
        ),
        CustomContainer(
          function: () {},

          text: 'Sign in with Google',
          icon: Image.asset("assets/google.png"),
        ),
        CustomContainer(
          function: () {},

          color: const Color(0xff235C95),
          text: 'Sign in with facebook',
          icon: Image.asset("assets/facebook.png"),
          textColor: Colors.white,
        ),
        // SizedBox(height: 79.h),
        Padding(
          padding: EdgeInsets.only(top: 79.h, bottom: 58.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextWidget(
                text: "Already member?",
                fontSize: 18,
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
                  text: "SignIn",
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff004D8E),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTextWidget(
              text: "By continue you agree to our",
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Color(0xff88909C),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TermsView()),
                );
              },
              child: const CustomTextWidget(
                text: "Terms of service",
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Color(0xff004D8E),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextWidget(
              text: "and our ",
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Color(0xff88909C),
            ),
            CustomTextWidget(
              text: "Privacy Policy",
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Color(0xff004D8E),
            ),
          ],
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}

class LandScapeView extends StatelessWidget {
  const LandScapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            padding: EdgeInsets.only(left: 37.w),
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
        ),

        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Center(
                    child: CustomTextWidget(
                      textAlign: TextAlign.center,
                      text: "Fruit Market",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 21.h, bottom: 52.h),
                    child: const CustomTextWidget(
                      textAlign: TextAlign.center,
                      text: "Welcome to Our app",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  CustomContainerLandScape(
                    function: () {},
                    text: 'Sign in with Phone',
                    icon: const Icon(Icons.phone),
                  ),
                  CustomContainerLandScape(
                    function: () {},
                    text: 'Sign in with Google',
                    icon: Image.asset("assets/google.png"),
                  ),
                  CustomContainerLandScape(
                    function: () {},
                    color: const Color(0xff235C95),
                    text: 'Sign in with facebook',
                    icon: Image.asset("assets/facebook.png"),
                    textColor: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 58.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: CustomTextWidget(
                            text: "Already member?",
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
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
                            text: "SignIn",
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff004D8E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ), //
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTextWidget(
              text: "By continue you agree to our",
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Color(0xff88909C),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TermsView()),
                );
              },
              child: const CustomTextWidget(
                text: "Terms of service",
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Color(0xff004D8E),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextWidget(
              text: "and our ",
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Color(0xff88909C),
            ),
            CustomTextWidget(
              text: "Privacy Policy",
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: Color(0xff004D8E),
            ),
          ],
        ),
        SizedBox(height: 15.h),
      ],
    ); 
  }
}

class CustomContainerLandScape extends StatelessWidget {
  const CustomContainerLandScape({
    super.key,
    required this.text,
    required this.icon,
    this.color,
    this.textColor,
    required this.function,
  });
  final String text;
  final Widget icon;
  final Color? color;
  final Color? textColor;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, bottom: 21.h),
      child: InkWell(
        onTap: function,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color ?? Colors.transparent,

            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(color: const Color(0xff656665)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10.w,
            children: [
              icon,

              Expanded(
                child: CustomTextWidget(
                  text: text,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: textColor ?? Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
