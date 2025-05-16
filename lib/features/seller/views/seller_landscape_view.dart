import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors/colors.dart';
import '../../../core/widgets/custom_text_widget.dart';

class LandScapeView extends StatefulWidget {
  const LandScapeView({super.key, required this.searchClicked});
final bool searchClicked;
  @override
  State<LandScapeView> createState() => _LandScapeViewState();
}

class _LandScapeViewState extends State<LandScapeView> {

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget. searchClicked)
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
            const SellersItem(),
            Padding(
              padding: EdgeInsets.only(left: 21.w, top: 1.5.h, bottom: 8.h),
              child: const CustomTextWidget(
                text: "Categories ",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const CategoryList(),
            Padding(
              padding: EdgeInsets.only(left: 21.w, top: 1.h, bottom: 7.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextWidget(
                    text: "Products",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/format.png", width: 17.w),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 18.h),
                    child: const ProductsItem(),
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
  bool isClicked = false;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: InkWell(
        onTap:
            () => setState(() {
              count = 1;
              isClicked = !isClicked;
            }),
        child: Container(
          padding: EdgeInsets.only(right: 34.w, left: 10.w),
          width: isClicked ? 394.w : 401.w,
          height: isClicked ? 450.h : 230.h,
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
          child: Column(
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

                          Container(
                            width: 102.w,
                            height: 50.h,
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
                        ],
                      ),
                    ),
                  ),
                  if (!isClicked) Image.asset("assets/add_to_cart.png"),
                ],
              ),
              if (isClicked)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 18.h),

                    const CustomTextWidget(
                      textAlign: TextAlign.start,
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff656565),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                        Container(
                          width: 144.w,
                          height: 60.h,
                          padding: EdgeInsets.only(
                            left: 10.w,
                            right: 10.w,
                            top: 0.h,
                            bottom: 4.h,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                spreadRadius: 0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],
                            color: const Color(0xff204F38),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/cart_icon.png"),
                              const CustomTextWidget(
                                text: "Add to Cart",
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SellersItem extends StatelessWidget {
  const SellersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 12.w, top: 15.h),
      height: 230.h,
      width: 412.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
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
                        text: "4.5",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff656565),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(alignment: Alignment.topCenter, "assets/badge.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<String> categoriesImages = [
    "assets/fruits.png",
    "assets/vegetables.png",
    "assets/phone.png",
    "assets/pets.png",
  ];
  List<String> categoriesTitles = ["Fruits", "Vegetables", "Phone", "Pets"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 27.w, right: 26.w, bottom: 11.h),
      child: SizedBox(
        height: 200.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesImages.length,
          itemBuilder:
              (context, index) => Padding(
                padding: EdgeInsets.only(
                  right: index == 3 ? 0.w : 10.w,
                  left: index == 0 ? 0.w : 10.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80.w,
                      height: 80.h,
                      padding: const EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Image.asset(categoriesImages[index]),
                    ),
                    SizedBox(height: 17.h),
                    CustomTextWidget(
                      textAlign: TextAlign.center,
                      text: categoriesTitles[index],
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
