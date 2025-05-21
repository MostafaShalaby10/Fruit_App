import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/widgets/custom_button_widget.dart';
import 'package:task_one/core/widgets/custom_text_widget.dart';

class LandScapeView extends StatelessWidget {
  const LandScapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: 250.w,

          child: ListView.builder(
            itemCount: 6,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: const ProductsItem(),
                ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 1.h, bottom: 5.h),
                child: const Row(
                  children: [
                    CustomTextWidget(
                      text: "Total Items",
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff656565),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        CustomTextWidget(
                          text: "4 Items in cart",
                          fontSize: 7,
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
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff656565),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        CustomTextWidget(
                          text: "36.00 ",
                          fontSize: 7,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff656565),
                        ),
                        CustomTextWidget(
                          text: "KD",
                          fontSize: 5,
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
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff656565),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomTextWidget(
                        text: "1.50 ",
                        fontSize: 7,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff656565),
                      ),
                      CustomTextWidget(
                        text: "KD",
                        fontSize: 5,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffBEBEBE),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              const Row(
                children: [
                  CustomTextWidget(
                    text: "Bag Total",
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff204F38),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomTextWidget(
                        text: "37.50 ",
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff204F38),
                      ),
                      CustomTextWidget(
                        text: "KD",
                        fontSize: 5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff204F38),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.h, top: 5.h),
                child: const Row(
                  children: [
                    CustomTextWidget(
                      text: "4 items in cart",
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff656565),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        CustomTextWidget(
                          text: "37.50 ",
                          fontSize: 7,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff656565),
                        ),
                        CustomTextWidget(
                          text: "KD",
                          fontSize: 5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff656565),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5),
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
                    child: const CustomTextWidget(
                      text: "Procced To Checkout",
                      fontSize: 7,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
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
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: MediaQuery.of(context).size.height * .3,
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
              child: Image.asset("assets/vegetables.png", fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),
                    const CustomTextWidget(
                      text: "Product name",
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomTextWidget(
                          text: "12.00 KD",
                          fontSize: 7,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff656565),
                        ),
                        SizedBox(width: 12.w),
                        const CustomTextWidget(
                          text: "14.00 KD",
                          fontSize: 7,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffD1D1D1),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 3.h,
                        horizontal: 5.w,
                      ),
                      width: MediaQuery.of(context).size.width * .2,
                      decoration: BoxDecoration(
                        color: const Color(0xffDF958F),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: const Center(
                        child: CustomTextWidget(
                          color: Colors.white,
                          text: "Up to 10% Off",
                          fontSize: 7,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      iconSize: 15,
                      visualDensity: VisualDensity.comfortable,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          if (count > 1) {
                            count--;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    CustomTextWidget(
                      text: "$count",
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                    ),
                    IconButton(
                      iconSize: 15,
                      visualDensity: VisualDensity.comfortable,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
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
    return Container(
      padding: const EdgeInsets.only(),
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
          fontSize: 9,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class FatoraDesign extends StatelessWidget {
  const FatoraDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            CustomTextWidget(
              text: "Subtotal",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff656565),
            ),
            Spacer(),
            Row(
              children: [
                CustomTextWidget(
                  text: "36.00 ",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff656565),
                ),
                CustomTextWidget(
                  text: "KD",
                  fontSize: 9,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffBEBEBE),
                ),
              ],
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: const Row(
            children: [
              CustomTextWidget(
                text: "Shipping Charges",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff656565),
              ),
              Spacer(),
              Row(
                children: [
                  CustomTextWidget(
                    text: "1.50 ",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff656565),
                  ),
                  CustomTextWidget(
                    text: "KD",
                    fontSize: 9,
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
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff204F38),
              ),
              Spacer(),
              Row(
                children: [
                  CustomTextWidget(
                    text: "37.50 ",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff204F38),
                  ),
                  CustomTextWidget(
                    text: "KD",
                    fontSize: 9,
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
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff656565),
                ),
                CustomTextWidget(
                  text: "37.50 KD",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff656565),
                ),
              ],
            ),
            // Spacer(),
            // CustomContainer(),
          ],
        ),
      ],
    );
  }
}
