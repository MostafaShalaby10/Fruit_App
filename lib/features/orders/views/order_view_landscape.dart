import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_one/features/checkout/views/checkout_view.dart';

import '../../../core/widgets/custom_text_widget.dart';

class LandScapeView extends StatelessWidget {
  const LandScapeView({super.key, required this.status});
  final List<String> status;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: status.length,
      itemBuilder:
          (context, index) => Padding(
            padding: EdgeInsets.only(
              bottom: 15.h,
              top: 1.h,
              left: 10.w,
              right: 10.w,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckoutView()),
                );
              },
              child: Container(
                padding: EdgeInsets.only(
                  left: 5.w,
                  top: 3.h,
                  bottom: 3.h,
                  right: 5.w,
                ),
                width: MediaQuery.of(context).size.width * .5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),

                      decoration: BoxDecoration(
                        color:
                            status[index] == "Delivering"
                                ? const Color(0xffFFF3C9)
                                : status[index] == "Finished"
                                ? const Color(0xffC0FBC8)
                                : status[index] == "Canceled"
                                ? const Color(0xffFFB8B8)
                                : status[index] == "Working"
                                ? const Color(0xff84A6FF)
                                : status[index] == "Delivered"
                                ? const Color(0xffF2A1FF)
                                : const Color(0xff9CE2FF),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: SvgPicture.asset(
                        status[index] == "Delivering"
                            ? "assets/delivering.svg"
                            : status[index] == "Finished"
                            ? "assets/finish.svg"
                            : status[index] == "Canceled"
                            ? "assets/cancel.svg"
                            : status[index] == "Working"
                            ? "assets/working.svg"
                            : status[index] == "Delivered"
                            ? "assets/deliverd.svg"
                            : "assets/new.svg",
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomTextWidget(
                            textAlign: TextAlign.start,
                            text: "#243188 - 37 KD",
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff292727),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomTextWidget(
                                text: "9 Sep",
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff656565),
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                width: 4.w,
                                height: 4.w,
                                decoration: const BoxDecoration(
                                  color: Color(0xff656565),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 8.w),

                              const CustomTextWidget(
                                text: "4 items",
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff656565),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Status :",
                                  style: TextStyle(
                                    color: const Color(0xff656565),
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: " ${status[index]}}",
                                  style: TextStyle(
                                    color:
                                        status[index] == "Delivering"
                                            ? const Color(0xffFEC500)
                                            : status[index] == "Finished"
                                            ? const Color(0xff00BB1A)
                                            : status[index] == "Canceled"
                                            ? const Color(0xffFF4A4A)
                                            : status[index] == "Working"
                                            ? const Color(0xff28B0E8)
                                            : status[index] == "Delivered"
                                            ? const Color(0xff28B0E8)
                                            : const Color(0xff28B0E8),
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 40.w,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color:
                            status[index] == "Delivering"
                                ? const Color(0xffFFF3C9)
                                : status[index] == "Finished"
                                ? const Color(0xffC0FBC8)
                                : status[index] == "Canceled"
                                ? const Color(0xffFFB8B8)
                                : status[index] == "Working"
                                ? const Color(0xff84A6FF)
                                : status[index] == "Delivered"
                                ? const Color(0xffF2A1FF)
                                : const Color(0xff9CE2FF),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
