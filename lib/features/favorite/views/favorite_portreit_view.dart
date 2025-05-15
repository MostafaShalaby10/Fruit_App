import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_text_widget.dart';
import '../../home/views/home_view.dart';

class PortreitView extends StatelessWidget {
  const PortreitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        centerTitle: true,
        title: const CustomTextWidget(
          text: "Favorite",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xff204F38),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder:
              (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: const ProductsItem(),
              ),
        ),
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
      width: 401.w,
      height: 115.h,
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

                      const CustomTextWidget(
                        text: "Store Name : Store 1",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff292727),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 9.w),
            child: Container(
              width: 50.w,
              height: 50.h,
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
              child: Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}
