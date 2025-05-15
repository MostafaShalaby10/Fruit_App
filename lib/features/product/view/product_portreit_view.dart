import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/widgets/custom_text_widget.dart';

class PortreitView extends StatefulWidget {
  const PortreitView({super.key});

  @override
  State<PortreitView> createState() => _PortreitViewState();
}

class _PortreitViewState extends State<PortreitView> {
  bool isSelectWeight = false;
  bool isSelectAddons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        centerTitle: true,
        title: const CustomTextWidget(
          text: "Product Name",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xff204F38),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined, size: 27),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ios_share_outlined, size: 27),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 21.h),
                child: Image.asset("assets/product.png"),
              ),
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: "Category Name",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff204F38),
                      ),
                      CustomTextWidget(
                        text: "Product name",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff292727),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextWidget(
                        text: "Price",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff656565),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CustomTextWidget(
                            text: "KD12.00 ",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff656565),
                          ),
                          SizedBox(width: 10.w),
                          const CustomTextWidget(
                            text: "KD14.00",
                            fontSize: 17,
                            textDecoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffDF958F),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const CustomTextWidget(
                textAlign: TextAlign.start,
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
                fontSize: 16,
                color: Color(0xff656565),
                fontWeight: FontWeight.w400,
              ),
              Padding(
                padding: EdgeInsets.only(top: 13.h, bottom: 21.h),
                child: const CustomTextWidget(
                  text: "Sell Per : Kartoon",
                  fontSize: 16,
                  color: Color(0xff656565),
                  fontWeight: FontWeight.w400,
                ),
              ),

              InkWell(
                onTap: () {
                  setState(() {
                    isSelectWeight = !isSelectWeight;
                  });
                },
                child: Row(
                  children: [
                    const CustomTextWidget(
                      text: "Select weight",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff292727),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        isSelectWeight
                            ? Icons.arrow_drop_up_sharp
                            : Icons.arrow_drop_down_sharp,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 0),
              if (isSelectWeight) const RadioButtonWeights(),
              // Radio Button
              InkWell(
                onTap: () {
                  setState(() {
                    isSelectAddons = !isSelectAddons;
                  });
                },
                child: Row(
                  children: [
                    const CustomTextWidget(
                      text: "Select  Addons",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff292727),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        isSelectAddons
                            ? Icons.arrow_drop_up_sharp
                            : Icons.arrow_drop_down_sharp,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 0),
              if (isSelectAddons) const RadioButtonAddons(),

              Padding(
                padding: EdgeInsets.only(left: 21.w, top: 25.h, bottom: 25.h),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 144.w,
                    height: 37.h,
                    padding: EdgeInsets.only(
                      bottom: 2.h,
                      left: 10.w,
                      right: 10.w,
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
                    child: Row(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioButtonWeights extends StatefulWidget {
  const RadioButtonWeights({super.key});

  @override
  State<RadioButtonWeights> createState() => _RadioButtonWeightsState();
}

class _RadioButtonWeightsState extends State<RadioButtonWeights> {
  String selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        ListTile(
          horizontalTitleGap: 0,

          contentPadding: const EdgeInsets.all(0),
          title: const CustomTextWidget(
            textAlign: TextAlign.start,
            text: "50 Gram - 4.00 KD",
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          leading: Radio<String>(
            value: 'Option 1',
            groupValue: selectedOption,
            onChanged: (String? value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),
        ),
        ListTile(
          horizontalTitleGap: 0,

          contentPadding: const EdgeInsets.all(0),
          title: const CustomTextWidget(
            textAlign: TextAlign.start,
            text: "1 Kg - 6.25 KD",
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          leading: Radio<String>(
            value: 'Option 2',
            groupValue: selectedOption,
            onChanged: (String? value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),
        ),
        ListTile(
          horizontalTitleGap: 0,

          contentPadding: const EdgeInsets.all(0),
          title: const CustomTextWidget(
            textAlign: TextAlign.start,

            text: "2 Kg - 12.00 KD",
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          leading: Radio<String>(
            value: 'Option 3',
            groupValue: selectedOption,
            onChanged: (String? value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}

class RadioButtonAddons extends StatefulWidget {
  const RadioButtonAddons({super.key});

  @override
  State<RadioButtonAddons> createState() => _RadioButtonAddonsState();
}

class _RadioButtonAddonsState extends State<RadioButtonAddons> {
  String selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: const CustomTextWidget(
            textAlign: TextAlign.start,
            text: "50 Gram - 4.00 KD",
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          leading: Radio<String>(
            value: 'Option 1',
            groupValue: selectedOption,
            onChanged: (String? value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),
        ),
        ListTile(
          horizontalTitleGap: 0,

          contentPadding: const EdgeInsets.all(0),
          title: const CustomTextWidget(
            textAlign: TextAlign.start,
            text: "1 Kg - 6.25 KD",
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          leading: Radio<String>(
            value: 'Option 2',
            groupValue: selectedOption,
            onChanged: (String? value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
