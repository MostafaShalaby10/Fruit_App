import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/features/orders/views/cancel_dialog_portreit.dart';

import '../../../core/widgets/custom_button_widget.dart';
import '../../../core/widgets/custom_text_widget.dart';

class OrderTrackingPortraitView extends StatelessWidget {
  const OrderTrackingPortraitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18.h, bottom: 7.h),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Your Order Code: ",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff656565),
                  ),
                ),
                TextSpan(
                  text: "#882610",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff656565),
                  ),
                ),
              ],
            ),
          ),
        ),
        const CustomTextWidget(
          text: "3 items - 37.50 KD",
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Color(0xff656565),
        ),
        SizedBox(height: 8.h),
        const CustomTextWidget(
          text: "Payment Method : Cash",
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Color(0xff656565),
        ),
        SizedBox(height: 22.h),
        const ProgressWidget(),
        SizedBox(height: 37.h),

        Container(
          // padding: EdgeInsets.all(10),
          width: 347.w,
          height: 51.h,
          decoration: BoxDecoration(
            color: const Color(0xff204F38),
            borderRadius: BorderRadius.circular(25.r),
            boxShadow: [
              BoxShadow(blurRadius: 4, color: Colors.black.withOpacity(.25)),
            ],
          ),
          child: CustomButtonWidget(
            text: "Confirm",
            function: () {},
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 22.h),

        Container(
          // padding: EdgeInsets.all(10),
          width: 347.w,
          height: 51.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(width: 0.w),
            boxShadow: [
              BoxShadow(blurRadius: 4, color: Colors.black.withOpacity(.25)),
            ],
          ),
          child: CustomButtonWidget(
            color: const Color(0xffFF4A4A),
            text: "Cancel Order",
            textColor: Colors.white,
            function: () {
              cancelDialogPortreit(context);
            },
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({super.key});

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 28.w),
      child: SingleChildScrollView(
        child: Row(
          children: [
            EasyStepper(
              disableScroll: true,
              onStepReached:
                  (value) => setState(() {
                    currentStep = value;
                  }),
              enableStepTapping: true,
              internalPadding: 0,
              fitWidth: true,

              lineStyle: const LineStyle(
                lineLength: 5,

                lineThickness: 3,
                activeLineColor: Color(0xff00BB1A),
                finishedLineColor: Color(0xff00BB1A),
                unreachedLineColor: Color(0xff00BB1A),
                lineSpace: 0,
                lineWidth: 3,

                lineType: LineType.normal,
              ),
              textDirection: TextDirection.rtl,
              titlesAreLargerThanSteps: false,
              direction: Axis.vertical,
              showLoadingAnimation: false,
              activeStepBorderColor: const Color(0xff00BB1A),
              finishedStepBorderColor: const Color(0xff00BB1A),
              borderThickness: 6,
              finishedStepBackgroundColor: const Color(0xff00BB1A),
              stepRadius: 17.r,
              activeStep: currentStep,
              steps: [
                EasyStep(
                  customStep: Container(
                    width: 31.w,
                    height: 29.h,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                  ),
                ),
                EasyStep(
                  customStep: Container(
                    width: 31.w,
                    height: 29.h,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                  ),
                ),
                EasyStep(
                  customStep: Container(
                    width: 31.w,
                    height: 29.h,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                  ),
                ),
                EasyStep(
                  customStep: Container(
                    width: 31.w,
                    height: 29.h,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                  ),
                ),
                EasyStep(
                  customStep: Container(
                    width: 31.w,
                    height: 29.h,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 45.h,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Order Placed\n",
                        style: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff292727),
                        ),
                      ),
                      TextSpan(
                        text: "We have received your order ",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff656565),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Confirmed\n",
                        style: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff292727),
                        ),
                      ),
                      TextSpan(
                        text: "Your order has been confirmed ",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff656565),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Order shipped\n",
                        style: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff292727),
                        ),
                      ),
                      TextSpan(
                        text: "Estimated for 10 September, 2021  ",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff656565),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Out for delivery\n",
                        style: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff292727),
                        ),
                      ),
                      TextSpan(
                        text: "Estimated for 10 September, 2021 ",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff656565),
                        ),
                      ),
                    ],
                  ),
                ),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Deliverd\n",
                        style: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff292727),
                        ),
                      ),
                      TextSpan(
                        text: "Estimated for 10 September, 2021 ",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff656565),
                        ),
                      ),
                    ],
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
