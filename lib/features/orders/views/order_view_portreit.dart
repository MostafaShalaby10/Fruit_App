import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_one/features/checkout/views/checkout_view.dart';
import 'package:task_one/features/orders/view_model/cubit/order_cubit.dart';
import '../../../core/widgets/custom_text_widget.dart';

class PortreitView extends StatelessWidget {
  const PortreitView({super.key, required this.status});
  final List<String> status;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return state is! LoadingGetOrdersState
            ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OrderCubit.get(context).orders.isEmpty
                    ? const Center(
                      child:  CustomTextWidget(
                        text: "There is no orders yet",
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                    : Expanded(
                      child: ListView.builder(
                        itemCount: OrderCubit.get(context).orders.length,
                        itemBuilder:
                            (context, index) => Padding(
                              padding: EdgeInsets.only(bottom: 15.h),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const CheckoutView(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 401.w,
                                  height: 102.h,
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
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 23.w,
                                      top: 14.h,
                                      bottom: 7.h,
                                      right: 27.w,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          width: 58.w,
                                          height: 58.h,
                                          decoration: BoxDecoration(
                                            color:
                                                OrderCubit.get(
                                                          context,
                                                        ).orders[index]["status"] ==
                                                        "Delivering"
                                                    ? const Color(0xffFFF3C9)
                                                    : OrderCubit.get(
                                                          context,
                                                        ).orders[index]["status"] ==
                                                        "Finished"
                                                    ? const Color(0xffC0FBC8)
                                                    : OrderCubit.get(
                                                          context,
                                                        ).orders[index]["status"] ==
                                                        "Canceled"
                                                    ? const Color(0xffFFB8B8)
                                                    : OrderCubit.get(
                                                          context,
                                                        ).orders[index]["status"] ==
                                                        "Working"
                                                    ? const Color(0xff84A6FF)
                                                    : OrderCubit.get(
                                                          context,
                                                        ).orders[index]["status"] ==
                                                        "Delivered"
                                                    ? const Color(0xffF2A1FF)
                                                    : const Color(0xff9CE2FF),
                                            borderRadius: BorderRadius.circular(
                                              100.r,
                                            ),
                                          ),
                                          child: SvgPicture.asset(
                                            OrderCubit.get(
                                                      context,
                                                    ).orders[index]["status"] ==
                                                    "Delivering"
                                                ? "assets/delivering.svg"
                                                : OrderCubit.get(
                                                      context,
                                                    ).orders[index]["status"] ==
                                                    "Finished"
                                                ? "assets/finish.svg"
                                                : OrderCubit.get(
                                                      context,
                                                    ).orders[index]["status"] ==
                                                    "Canceled"
                                                ? "assets/cancel.svg"
                                                : OrderCubit.get(
                                                      context,
                                                    ).orders[index]["status"] ==
                                                    "Working"
                                                ? "assets/working.svg"
                                                : OrderCubit.get(
                                                      context,
                                                    ).orders[index]["status"] ==
                                                    "Delivered"
                                                ? "assets/deliverd.svg"
                                                : "assets/new.svg",
                                          ),
                                        ),
                                        SizedBox(width: 19.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomTextWidget(
                                                textAlign: TextAlign.start,
                                                text:
                                                    "${OrderCubit.get(context).orders[index]["id"]} - 37 KD",
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xff292727),
                                              ),
                                              Row(
                                                children: [
                                                  const CustomTextWidget(
                                                    text: "9 Sep",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff656565),
                                                  ),
                                                  SizedBox(width: 8.w),
                                                  Container(
                                                    width: 4.w,
                                                    height: 4.w,
                                                    decoration:
                                                        const BoxDecoration(
                                                          color: Color(
                                                            0xff656565,
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                  ),
                                                  SizedBox(width: 8.w),

                                                  CustomTextWidget(
                                                    text:
                                                        OrderCubit.get(context)
                                                            .orders[index]["products"]
                                                            .length
                                                            .toString(),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                      0xff656565,
                                                    ),
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
                                                        color: const Color(
                                                          0xff656565,
                                                        ),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          " ${OrderCubit.get(context).orders[index]["status"]}}",
                                                      style: TextStyle(
                                                        color:
                                                            OrderCubit.get(
                                                                      context,
                                                                    ).orders[index]["status"] ==
                                                                    "Delivering"
                                                                ? const Color(
                                                                  0xffFEC500,
                                                                )
                                                                : OrderCubit.get(
                                                                      context,
                                                                    ).orders[index]["status"] ==
                                                                    "Finished"
                                                                ? const Color(
                                                                  0xff00BB1A,
                                                                )
                                                                : OrderCubit.get(
                                                                      context,
                                                                    ).orders[index]["status"] ==
                                                                    "Canceled"
                                                                ? const Color(
                                                                  0xffFF4A4A,
                                                                )
                                                                : OrderCubit.get(
                                                                      context,
                                                                    ).orders[index]["status"] ==
                                                                    "Working"
                                                                ? const Color(
                                                                  0xff28B0E8,
                                                                )
                                                                : OrderCubit.get(
                                                                      context,
                                                                    ).orders[index]["status"] ==
                                                                    "Delivered"
                                                                ? const Color(
                                                                  0xff28B0E8,
                                                                )
                                                                : const Color(
                                                                  0xff28B0E8,
                                                                ),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 66.w,
                                          height: 66.h,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              100.r,
                                            ),
                                            color:
                                                OrderCubit.get(
                                                          context,
                                                        ).orders[index]["status"] ==
                                                        "Delivering"
                                                    ? const Color(0xffFFF3C9)
                                                    : OrderCubit.get(
                                                          context,
                                                        ).orders[index]["status"] ==
                                                        "Finished"
                                                    ? const Color(0xffC0FBC8)
                                                    : OrderCubit.get(
                                                          context,
                                                        ).orders[index]["status"] ==
                                                        "Canceled"
                                                    ? const Color(0xffFFB8B8)
                                                    : OrderCubit.get(
                                                          context,
                                                        ).orders[index]["status"] ==
                                                        "Working"
                                                    ? const Color(0xff84A6FF)
                                                    : OrderCubit.get(
                                                          context,
                                                        ).orders[index]["status"] ==
                                                        "Delivered"
                                                    ? const Color(0xffF2A1FF)
                                                    : const Color(0xff9CE2FF),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Colors.black.withOpacity(
                                                  0.25,
                                                ),
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
                            ),
                      ),
                    ),
              ],
            )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
