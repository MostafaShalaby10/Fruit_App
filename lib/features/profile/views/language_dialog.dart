import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_button_widget.dart';
import '../../../core/widgets/custom_text_widget.dart';

Future languageDialog(context) async => showDialog(
  context: context,
  builder:
      (context) => StatefulBuilder(
        builder:
            (context, setState) => SizedBox(
              height: 284.h,
              child: AlertDialog(
                backgroundColor: Colors.white,

                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const RadioButton(),
                    SizedBox(
                      width: 244.w,
                      child: CustomButtonWidget(
                        text: "Apply",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        function: () {},
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

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String selectedOption = "Option 1";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Row(
            children: [
              Image.asset("assets/saudi_arabia.png"),
              SizedBox(width: 6.w),
              const CustomTextWidget(
                textAlign: TextAlign.start,
                text: "العربيه",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ],
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
          title: Row(
            children: [
              Image.asset("assets/usa.png"),
              SizedBox(width: 6.w),
              const CustomTextWidget(
                textAlign: TextAlign.start,

                text: "English",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ],
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
