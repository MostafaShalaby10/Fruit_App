import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/widgets/custom_text_widget.dart';

class LandScapeView extends StatefulWidget {
  const LandScapeView({super.key});

  @override
  State<LandScapeView> createState() => _LandScapeViewState();
}

class _LandScapeViewState extends State<LandScapeView> {
  bool isSelectWeight = false;
  bool isSelectAddons = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.h),
          child: SizedBox(
            child: Image.asset("assets/product.png", fit: BoxFit.cover),
          ),
        ),
        Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: "Category Name",
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff204F38),
                ),
                CustomTextWidget(
                  text: "Product name",
                  fontSize: 11,
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
                  fontSize: 9,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff656565),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomTextWidget(
                      text: "KD12.00 ",
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff656565),
                    ),
                    SizedBox(width: 10.w),
                    const CustomTextWidget(
                      text: "KD14.00",
                      fontSize: 7,
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
          fontSize: 9,
          color: Color(0xff656565),
          fontWeight: FontWeight.w400,
        ),
        Padding(
          padding: EdgeInsets.only(top: 13.h, bottom: 21.h),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: CustomTextWidget(
              text: "Sell Per : Kartoon",
              fontSize: 9,
              color: Color(0xff656565),
              fontWeight: FontWeight.w400,
            ),
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
                fontSize: 11,
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
                fontSize: 11,
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
              width: MediaQuery.of(context).size.width * .3,
              padding: EdgeInsets.only(bottom: 2.h, left: 10.w, right: 10.w),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/cart_icon.png"),
                  const CustomTextWidget(
                    text: "Add to Cart",
                    fontSize: 9,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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
            fontSize: 9,
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
            fontSize: 9,
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
            fontSize: 9,
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
            fontSize: 9,
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
            fontSize: 9,
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
