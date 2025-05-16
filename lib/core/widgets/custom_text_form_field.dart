import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, this.fontSize});
  final String hintText;
  final double? fontSize; 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: fontSize?? 14.sp,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
