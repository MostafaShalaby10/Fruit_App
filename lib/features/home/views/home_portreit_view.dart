import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/widgets/custom_text_widget.dart';
import '../../product/view/product_view.dart';
import '../../seller/views/seller_view.dart';
import 'home_view.dart';

class PortreitView extends StatefulWidget {
  const PortreitView({super.key, required this.cards});
  final List cards;
  @override
  State<PortreitView> createState() => _PortreitViewState();
}

class _PortreitViewState extends State<PortreitView> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (searchClicked)
          Padding(
            padding: EdgeInsets.only(
              left: 18.w,
              right: 25.w,
              top: 22.h,
              bottom: 11.h,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "What are you looking for?",
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: const Icon(Icons.search),

                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        CarouselSlider(
          options: CarouselOptions(
            height: 130.h,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _index = index;
              });
            },
          ),
          items:
              [1, 2, 3, 4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        fit: BoxFit.fill,
                        width: 400.w,
                        "assets/home.png",
                      ),
                    );
                  },
                );
              }).toList(),
        ),
        Center(
          child: SmoothIndicator(
            offset: _index.toDouble(),
            count: 4,
            size: const Size(49, 7),
            effect: WormEffect(
              activeDotColor: const Color(0xff707070),
              dotColor: Colors.black12,
              dotWidth: 10.w,
              dotHeight: 10.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 27.w,
            right: 26.w,
            bottom: 11.h,
            top: 15.h,
          ),
          child: SizedBox(
            height: 80.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.cards.length,
              itemBuilder:
                  (context, index) => InkWell(
                    onTap: () {

Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => const ProductView(),
  ),
);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const ProductView(),
                      //   ),
                      // );
                    },
                    child: Container(
                      width: 80.w,
                      height: 80.h,
                      padding: const EdgeInsets.all(10),
                      margin: EdgeInsets.only(
                        right: index == 3 ? 0.w : 10.w,
                        left: index == 0 ? 0.w : 10.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Image.asset(widget.cards[index], fit: BoxFit.fill),
                    ),
                  ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 13.w, right: 9.w, bottom: 10.h),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: "Sellers",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              CustomTextWidget(
                text: "Show all",
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Color(0xff235C95),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder:
              (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SellerView(),
                      ),
                    );
                  },
                  child: const SellersItem(),
                ),
              ),
        ),
      ],
    );
  }
}

class SellersItem extends StatelessWidget {
  const SellersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 12.w),
      height: 104.h,
      width: 412.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.16),
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/logo.png", width: 82.w, height: 82.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 26.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CustomTextWidget(
                        text: "Seller name",
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: 7.w),
                      Image.asset("assets/badge.png"),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/fesba.png"),
                      const CustomTextWidget(
                        text: " Delivery Charges : 0.5 KD",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Container(
                          width: 5.w,
                          height: 4.w,
                          color: const Color(0xffC8C8C8),
                        ),
                      ),
                      const CustomTextWidget(
                        text: "Open",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff00BB1A),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w, left: 10.w),
                        child: Container(
                          width: 5.w,
                          height: 4.w,
                          color: const Color(0xffC8C8C8),
                        ),
                      ),
                      const CustomTextWidget(
                        text: "Beverages",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff51949F),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTextWidget(
                text: "4.5",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xff656565),
              ),
              Row(
                children: [
                  CustomTextWidget(
                    text: "2.5 KM",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff204F38),
                  ),
                  Icon(
                    Icons.pin_drop_outlined,
                    color: Color(0xff204F38),
                    size: 15,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
