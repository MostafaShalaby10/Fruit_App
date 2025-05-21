import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_one/core/widgets/custom_button_widget.dart';
import 'package:task_one/features/checkout/views/successfully_view.dart';

import '../../../core/widgets/custom_text_widget.dart';

class PortreitView extends StatefulWidget {
  const PortreitView({super.key});

  @override
  State<PortreitView> createState() => _PortreitViewState();
}

class _PortreitViewState extends State<PortreitView> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 80.h,
            child: EasyStepper(
              padding: const EdgeInsets.all(0),
              internalPadding: 80,
              borderThickness: 5,
              defaultStepBorderType: BorderType.normal,
      
              activeStepIconColor: const Color(0xff204F38),
              stepRadius: 12,
              fitWidth: true,
              activeStep: currentStep,
              activeStepBackgroundColor: Colors.transparent,
              finishedStepBackgroundColor: Colors.transparent,
              finishedStepBorderColor: const Color(0xff204F38),
              activeStepBorderColor: const Color(0xff204F38),
              finishedStepBorderType: BorderType.normal,
              showLoadingAnimation: false,
              steps: [
                const EasyStep(
                  customTitle: CustomTextWidget(
                    text: "Delivery Time",
                    fontSize: 16,
      
                    fontWeight: FontWeight.w400,
                    color: Color(0xff204F38),
                    textAlign: TextAlign.center,
                  ),
      
                  customStep: Icon(Icons.circle, size: 6),
                  activeIcon: Icon(Icons.circle),
                ),
                const EasyStep(
                  customTitle: CustomTextWidget(
                    text: "Delivery Address",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff204F38),
                    textAlign: TextAlign.center,
                  ),
      
                  customStep: Icon(Icons.circle, size: 6),
      
                  activeIcon: Icon(Icons.circle),
                ),
                const EasyStep(
                  customTitle: CustomTextWidget(
                    text: "Payment",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff204F38),
                    textAlign: TextAlign.center,
                  ),
                  customStep: Icon(Icons.circle, size: 6),
      
                  activeIcon: Icon(Icons.circle),
                ),
              ],
              onStepReached: (value) {
                setState(() {
                  currentStep = value;
                });
              },
            ),
          ),
          Container(height: 1.h, color: Colors.black, width: double.infinity),
          if (currentStep == 0) const DeliveryPage(),
          if (currentStep == 1) const AddressPage(),
          if (currentStep == 2) const PaymentPage(),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: SizedBox(
              width: 347.w,
              height: 51.h,
              child: CustomButtonWidget(
                text: currentStep == 2 ? "Place Order" : "Continue",
                function: () {
                  if (currentStep < 2) {
                    setState(() {
                      currentStep++;
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessfullyView(),
                      ),
                    );
                  }
                },
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  bool isNowChecked = true;
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 13.w, right: 16.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 19.h, bottom: 23.h),
            child: InkWell(
              onTap: () {
                setState(() {
                  isNowChecked = true;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                width: 389.w,
                height: 51.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.black.withOpacity(.25),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextWidget(
                      text: "Now",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff292727),
                    ),

                    Container(
                      width: 26.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        color:
                            isNowChecked
                                ? const Color(0xff204F38)
                                : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 0.7.w),
                      ),
                      child:
                          isNowChecked
                              ? const Icon(
                                Icons.check,
                                size: 14,
                                color: Colors.white,
                              )
                              : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isNowChecked = false;
              });
            },
            child: Container(
              width: 401.w,
              height: 130.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(.25),
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 26.w, right: 26.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 21.h, bottom: 14.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomTextWidget(
                            text: "Select Delivery Time ",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff292727),
                          ),

                          Container(
                            width: 26.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  isNowChecked
                                      ? Colors.transparent
                                      : const Color(0xff204F38),
                              border: Border.all(
                                color: Colors.black,
                                width: 0.7.w,
                              ),
                            ),
                            child:
                                isNowChecked
                                    ? null
                                    : const Icon(
                                      Icons.check,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const CustomTextWidget(
                      text: "Select Date",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff4A4A4A),
                    ),

                    SizedBox(
                      height: 40.h,
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        style: const TextStyle(color: Color(0xff204F38)),
                        textAlign: TextAlign.start,
                        controller: dateController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () async {
                              DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2021),
                                lastDate: DateTime(2027),
                              );
                              setState(() {
                                dateController.text =
                                    "${date!.day}-${date.month}-${date.year}";
                              });
                            },
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                          ),
                          border: const UnderlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 28.h),
        ],
      ),
    );
  }
}

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w, right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 13.h, bottom: 15.h),
            child: const CustomTextWidget(
              text: "Select Delivery Address",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff292727),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              width: 389.w,
              height: 51.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(.25),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextWidget(
                    text: "Add New Address",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff292727),
                  ),

                  Container(
                    width: 26.w,
                    height: 24.h,
                    color: Colors.transparent,
                    child: const Icon(Icons.add, size: 25),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Container(
              padding: EdgeInsets.only(left: 29.w, right: 23.w),
              width: 401.w,
              height: 163.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),

                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(.25),
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 19.h, bottom: 9.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.location_on_outlined),
                        const Expanded(
                          child: CustomTextWidget(
                            textAlign: TextAlign.left,
                            text: "  Address 1",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff292727),
                          ),
                        ),

                        Container(
                          width: 26.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xff204F38),
                            border: Border.all(
                              color: Colors.black,
                              width: 0.7.w,
                            ),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomTextWidget(
                    text: "John Doe",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff4A4A4A),
                  ),
                  const CustomTextWidget(
                    text: "+000-11-1234567",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff4A4A4A),
                  ),
                  SizedBox(height: 9.h),
                  const CustomTextWidget(
                    textAlign: TextAlign.start,
                    text:
                        "Room # 1 - Ground Floor, Al Najoum Building, 24 B Street, Dubai - United Arab Emirates",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9F9F9F),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28.h),
        ],
      ),
    );
  }
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 21.w, right: 19.w, top: 17.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text: "Coupon Code",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff292727),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 14.h),
            child: Container(
              width: 389.w,
              height: 51.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(.25),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                      top: 8.5.h,
                      right: 15.w,
                      bottom: 8.5.h,
                    ),
                    child: Container(
                      width: 85.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ],
                      ),
                      child: CustomButtonWidget(text: "Apply", function: () {}),
                    ),
                  ),
                  hintText: "Do You Have any Coupon Code?",
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff4A4A4A),
                  ),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
            child: const Row(
              children: [
                CustomTextWidget(
                  text: "Total Items",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff656565),
                ),
                Spacer(),
                Row(
                  children: [
                    CustomTextWidget(
                      text: "4 Items in cart",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff656565),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: const Row(
              children: [
                CustomTextWidget(
                  text: "Subtotal",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff656565),
                ),
                Spacer(),
                Row(
                  children: [
                    CustomTextWidget(
                      text: "36.00 ",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff656565),
                    ),
                    CustomTextWidget(
                      text: "KD",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffBEBEBE),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Row(
            children: [
              CustomTextWidget(
                text: "Shipping Charges",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff656565),
              ),
              Spacer(),
              Row(
                children: [
                  CustomTextWidget(
                    text: "1.50 ",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff656565),
                  ),
                  CustomTextWidget(
                    text: "KD",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffBEBEBE),
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.only(bottom: 22.h, top: 11.h),
            child: const Row(
              children: [
                CustomTextWidget(
                  text: "Bag Total",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff204F38),
                ),
                Spacer(),
                Row(
                  children: [
                    CustomTextWidget(
                      text: "37.50 ",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff204F38),
                    ),
                    CustomTextWidget(
                      text: "KD",
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff204F38),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const CustomTextWidget(
            text: "Payment",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff292727),
          ),

          Padding(
            padding: EdgeInsets.only(top: 22.h, bottom: 24.h),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                width: 389.w,
                height: 51.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.black.withOpacity(.25),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/visa.svg"),
                    const Expanded(
                      child: CustomTextWidget(
                        textAlign: TextAlign.start,
                        text: " Credit Card/Debit card",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff292727),
                      ),
                    ),

                    Container(
                      width: 26.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 0
                                ? const Color(0xff204F38)
                                : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 0.7.w),
                      ),
                      child:
                          selectedIndex == 0
                              ? const Icon(
                                Icons.check,
                                size: 14,
                                color: Colors.white,
                              )
                              : null,
                      // : null,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 24.h),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                width: 389.w,
                height: 51.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.black.withOpacity(.25),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/cash.svg"),
                    const Expanded(
                      child: CustomTextWidget(
                        textAlign: TextAlign.start,
                        text: " Cash of Delivery",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff292727),
                      ),
                    ),

                    Container(
                      width: 26.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 1
                                ? const Color(0xff204F38)
                                : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 0.7.w),
                      ),
                      child:
                          selectedIndex == 1
                              ? const Icon(
                                Icons.check,
                                size: 14,
                                color: Colors.white,
                              )
                              : null,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 28.h),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                width: 389.w,
                height: 51.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.black.withOpacity(.25),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/knet.svg"),
                    const Expanded(
                      child: CustomTextWidget(
                        textAlign: TextAlign.start,
                        text: " Knet",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff292727),
                      ),
                    ),

                    Container(
                      width: 26.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 2
                                ? const Color(0xff204F38)
                                : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 0.7.w),
                      ),
                      child:
                          selectedIndex == 2
                              ? const Icon(
                                Icons.check,
                                size: 14,
                                color: Colors.white,
                              )
                              : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
