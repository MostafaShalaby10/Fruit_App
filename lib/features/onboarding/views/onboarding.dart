import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_one/core/colors/colors.dart';
import 'package:task_one/core/widgets/custom_button_widget.dart';
import 'package:task_one/core/widgets/custom_text_widget.dart';
import 'package:task_one/features/welcome/views/welcome_scree_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isLastPage)
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 76.h, right: 37.w),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreeView(),
                        ),
                        (route) => false,
                      );
                    },
                    child: const CustomTextWidget(
                      textAlign: TextAlign.right,
                      text: "Skip",
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff656565),
                    ),
                  ),
                ),
              ),
            SizedBox(height: isLastPage ? 190.h : 61.h),
            Padding(
              padding: EdgeInsets.only(right: 80.w, left: 64.w),
              child: SizedBox(
                height: 442.h,
                width: 285.11.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 393.h,
                      child: PageView.builder(
                        onPageChanged:
                            (index) => setState(() {
                              if (index == 2) {
                                isLastPage = true;
                              } else {
                                isLastPage = false;
                              }
                            }),
                        controller: pageController,
                        itemCount: 3,
                        itemBuilder:
                            (context, index) => Column(
                              children: [
                                Image.asset("assets/onboarding.png"),
                                const CustomTextWidget(
                                  text: "E Shopping",
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                const CustomTextWidget(
                                  text: "Explore op organic fruits & grab them",
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff78787C),
                                ),
                              ],
                            ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: pageController, // PageController
                      count: 3,
                      effect: const WormEffect(
                        activeDotColor: primaryColor,
                        dotColor: Colors.black12,
                        dotWidth: 10,
                        dotHeight: 10,
                      ), // your preferred effect
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 98.h),
            CustomButtonWidget(
              text: isLastPage ? "Get Started" : "Next",
              function: () {
                if (isLastPage) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreeView(),
                    ),
                    (route) => false,
                  );
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
