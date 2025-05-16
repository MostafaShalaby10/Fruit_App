import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/widgets/custom_text_widget.dart';


class LandScapeView extends StatelessWidget {
  const LandScapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder:
              (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: const ProductsItem(),
              ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 19.w, right: 21.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),

              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
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

              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: const Row(
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
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 43.h),
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
              const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: "4 items in cart",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff656565),
                      ),
                      CustomTextWidget(
                        text: "37.50 KD",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff656565),
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomContainer(),
                ],
              ),
            ],
          ),
        ),
      ],
    ); 
  }
}

class ProductsItem extends StatefulWidget {
  const ProductsItem({super.key});

  @override
  State<ProductsItem> createState() => _ProductsItemState();
}

class _ProductsItemState extends State<ProductsItem> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        padding: EdgeInsets.only(right: 12.w, left: 10.w),
        width: 401.w,
        height: 240.h,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.16),
            ),
          ],
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.r),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: Colors.black.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/vegetables.png",
                    width: 57.w,
                    height: 59.h,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 22.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),

                        const CustomTextWidget(
                          text: "Product name",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            const CustomTextWidget(
                              text: "12.00 KD",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff656565),
                            ),
                            SizedBox(width: 12.w),
                            const CustomTextWidget(
                              text: "14.00 KD",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffD1D1D1),
                            ),
                          ],
                        ),

                        SizedBox(height: 10.h),

                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 45.h,
                                padding: EdgeInsets.symmetric(horizontal: 7.w),
                                decoration: BoxDecoration(
                                  color: const Color(0xffDF958F),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: const Center(
                                  child: CustomTextWidget(
                                    color: Colors.white,
                                    text: "Up to 10% Off",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: 126.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.r),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    color: Colors.black.withOpacity(0.25),
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (count > 1) {
                                          count--;
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.remove, size: 30),
                                  ),
                                  CustomTextWidget(
                                    text: "$count",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        count++;
                                      });
                                    },
                                    icon: const Icon(Icons.add, size: 30),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 21.w, top: 25.h, bottom: 25.h),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 181.w,
          height: 90.h,
          padding: EdgeInsets.only(
            bottom: 6.h,
            left: 10.w,
            right: 10.w,
            top: 2.h,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff204F38),
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff656565).withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 4,
              ),
            ],
          ),
          child: const Center(
            child: CustomTextWidget(
              text: "Procced To Checkout",
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
