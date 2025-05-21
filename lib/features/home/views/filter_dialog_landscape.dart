import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_button_widget.dart';
import '../../../core/widgets/custom_text_widget.dart';

Future filterDialogLandScape(context) async => showDialog(
  context: context,
  builder:
      (context) => StatefulBuilder(
        builder:
            (context, setState) => SizedBox(
              height: 400.h,
              child: AlertDialog(
                backgroundColor: Colors.white,
                title: const CustomTextWidget(
                  text: "Filter by",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),

                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const CustomTextWidget(
                            text: "Delivered To",
                            fontSize: 9,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff858D9A),
                          ),
                          SizedBox(width: 5.w),
                          Image.asset("assets/fesba.png"),
                        ],
                      ),
                      Row(
                        children: [
                          const DropMenu(),
                          Expanded(child: const RadioButton()),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        child: CustomButtonWidget(
                          text: "Apply Filter",
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          function: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                actionsAlignment: MainAxisAlignment.center,
                contentPadding: EdgeInsets.only(
                  left: 29.w,
                  bottom: 23.h,
                  top: 21.h,
                  right: 29.w,
                ),
                actionsPadding: const EdgeInsets.all(0),
                actions: [
                  TextButton(
                    child: const CustomTextWidget(
                      text: "Close",
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      color: Color(0xff656565),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              ),
            ),
      ),
);

class DropMenu extends StatefulWidget {
  const DropMenu({super.key});

  @override
  State<DropMenu> createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  String selectedValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
      child: Container(
        padding: EdgeInsets.only(
          left: 1.w,
          right: 18.w,
          top: 10.h,
          bottom: 10.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
            ),
          ],
        ),
        // height: 60.h,
        width: MediaQuery.of(context).size.width * .35,
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(25.r),
          value: selectedValue,
          items:
              <String>['Option 1', 'Option 2', 'Option 3'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: CustomTextWidget(
                    text: value,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                );
              }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
        ),
      ),
    );
  }
}

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
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
            text: "Offers",
            fontSize: 11,
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
          contentPadding: const EdgeInsets.all(0),
          horizontalTitleGap: 0,

          title: const CustomTextWidget(
            textAlign: TextAlign.start,

            text: "Free Delivery",
            fontSize: 11,
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
