import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_text_widget.dart';

class LandScapeView extends StatelessWidget {
  const LandScapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder:
          (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: const ProductsItem(),
          ),
    );
  }
}

class ProductsItem extends StatelessWidget {
  const ProductsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 12.w, left: 10.w),
      height: 180.h,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: Image.asset("assets/vegetables.png", width: 45.w),
          ),
          Padding(
            padding: EdgeInsets.only(left: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

                const CustomTextWidget(
                  text: "Product name",
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    const CustomTextWidget(
                      text: "12.00 KD",
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff656565),
                    ),
                    SizedBox(width: 12.w),
                    const CustomTextWidget(
                      text: "14.00 KD",
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffD1D1D1),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                const CustomTextWidget(
                  text: "Store Name : Store 1",
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff292727),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 9.w),
            child: Container(
              width: 25.w,
              height: 60.h,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}
