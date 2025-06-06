import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:task_one/core/widgets/nav_bar_widget.dart';

import '../../../core/services/colors/colors.dart';
import '../../../core/widgets/custom_button_widget.dart';
import '../../../core/widgets/custom_text_widget.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  int _seconds = 60;
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? PortreitView(seconds: _seconds)
                : LandScapeView(seconds: _seconds),
      ),
    );
  }
}

class PortreitView extends StatelessWidget {
  const PortreitView({super.key, required this.seconds});

  final int seconds;

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
          padding: EdgeInsets.only(top: 21.h, bottom: 52.h),
          child: const CustomTextWidget(
            textAlign: TextAlign.center,
            text: "Enter Received OTP",
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 83.w),
          child: Pinput(
            defaultPinTheme: PinTheme(
              width: 48.w,
              height: 48.h,
              textStyle: const TextStyle(
                fontSize: 20,
                color: Color(0xff929292),
              ),
              decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                border: Border.all(color: const Color(0xff929292)),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            length: 4,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 52.h,
            right: 41.w,
            left: 42.w,
            bottom: 40.h,
          ),
          child: SizedBox(
            width: 347.w,
            height: 51.h,
            child: CustomButtonWidget(
              function: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigationBarWidget(),
                  ),
                  (route) => false,
                );
              },
              text: "Confirm",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomTextWidget(
          text: seconds.toString(),
          fontSize: 30,
          fontWeight: FontWeight.w400,
          color: const Color(0xff707070),
        ),
        Padding(
          padding: EdgeInsets.only(top: 34.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextWidget(
                text: "Not received? ",
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff707070),
              ),
              TextButton(
                onPressed: () {
                  // _seconds = 60;
                  // startTimer();
                },
                child: const CustomTextWidget(
                  text: "Send Again",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff235C95),
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
  const LandScapeView({super.key, required this.seconds});

  final int seconds;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50.h, left: 10.w),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomTextWidget(
                    textAlign: TextAlign.center,
                    text: "Fruit Market",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 21.h, bottom: 52.h),
                    child: const CustomTextWidget(
                      textAlign: TextAlign.center,
                      text: "Enter Received OTP",
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  spacing: 30.h,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Pinput(
                      defaultPinTheme: PinTheme(
                        width: 35.w,
                        height: 90.h,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color(0xff929292),
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          border: Border.all(color: const Color(0xff929292)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      length: 4,
                    ),
                    SizedBox(
                      height: 60.h,
                      child: CustomButtonWidget(
                        function: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigationBarWidget(),
                            ),
                            (route) => false,
                          );
                        },
                        text: "Confirm",
                        fontWeight: FontWeight.w900,
                        fontSize: 9,
                      ),
                    ),
                    CustomTextWidget(
                      text: seconds.toString(),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff707070),
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
              text: "Not received? ",
              fontSize: 9,
              fontWeight: FontWeight.w400,
              color: Color(0xff707070),
            ),
            TextButton(
              onPressed: () {
                // _seconds = 60;
                // startTimer();
              },
              child: const CustomTextWidget(
                text: "Send Again",
                fontSize: 9,
                fontWeight: FontWeight.w400,
                color: Color(0xff235C95),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
