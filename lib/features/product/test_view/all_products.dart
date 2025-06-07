import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/features/product/view/product_view.dart';

import '../../../core/widgets/custom_text_widget.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key, required this.items});
  final List items;

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Products')),
      body:
          widget.items.isNotEmpty
              ? Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 60.h,
                      child: ListView.builder(
                        itemCount: widget.items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder:
                            (context, index) => InkWell(
                              onTap: () {
                                setState(() {
                                  this.index = index;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.h,
                                    horizontal: 20.w,
                                  ),

                                  decoration: BoxDecoration(
                                    color:
                                        this.index == index
                                            ? const Color(0xff204F38)
                                            : Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.black12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: CustomTextWidget(
                                      text: widget.items[index]["name"],
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          this.index == index
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      ),
                    ),
                  ),
                  if (widget.items[index]["products"].isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.items[index]["products"].length,

                        itemBuilder:
                            (context, index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: ProductsItem(
                                data: widget.items[this.index]["products"][index],
                                image:
                                    "https://masool.net/fruits-app/public/uploads/${widget.items[this.index]["products"][index]["img"]}",
                                price:
                                    widget.items[this
                                        .index]["products"][index]["price"],
                                productName:
                                    widget.items[this
                                        .index]["products"][index]["name"],
                              ),
                            ),
                      ),
                    ),
                  if (widget.items[index]["products"].isEmpty)
                    const Center(
                      child: CustomTextWidget(
                        text: "There is no products",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              )
              : const Center(
                child: CustomTextWidget(
                  text: "There is no Category",
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
    );
  }
}

class ProductsItem extends StatelessWidget {
  const ProductsItem({
    super.key,
    required this.productName,
    required this.image,
    required this.price,
    required this.data,
  });
  final String productName;
  final String image;
  final dynamic price;
  final Map data;

  // bool isClicked =;

  // bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: InkWell(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductView(data: data,)),
            ),
        child: Container(
          padding: EdgeInsets.only(right: 34.w, left: 10.w),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        width: 57.w,
                        height: 59.h,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 22.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),

                          CustomTextWidget(
                            overflow: TextOverflow.ellipsis,
                            text: productName,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              CustomTextWidget(
                                text: "$price KD",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff656565),
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
                            height: 22.h,
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
                  // if (!isClicked) Image.asset("assets/add_to_cart.png"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
