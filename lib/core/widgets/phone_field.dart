import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    required this.hintText,
    this.fontSize,
    this.controller,
  });
  final String hintText;
  final double? fontSize;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      disableLengthCheck: true,
      validator: (value) {
        if (value == null) {
          return 'can\'t be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: fontSize ?? 14.sp,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide.none,
        ),
      ),
      initialCountryCode: "Egypt",
      showCountryFlag: false,
    );
  }
}
