import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_button_widget.dart';
import '../../../core/widgets/custom_text_widget.dart';

Future cancelDialogPortreit(context) async => showDialog(
  context: context,
  builder:
      (context) => StatefulBuilder(
        builder:
            (context, setState) => SizedBox(
              height: 348.h,
              child: AlertDialog(
                backgroundColor: Colors.white,
                title: const CustomTextWidget(
                  text: "Cancel Orderd",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),

                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextWidget(
                      text: "Reason",
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff858D9A),
                    ),

                    const DropMenu(),

                    const CustomTextWidget(
                      text: "Reason",
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff858D9A),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: TextField(
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 17.h),
                    Center(
                      child: SizedBox(
                        width: 224.w,
                        child: CustomButtonWidget(
                          text: "Confirm Cancelation",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          function: () {},
                        ),
                      ),
                    ),
                  ],
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
                      fontSize: 16,
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
        height: 43.h,
        width: 315.w,
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
                    fontSize: 14,
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
