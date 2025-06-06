import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.color,
    this.textAlign,
    this.textDecoration, this.overflow,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;


  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign ?? TextAlign.center,
      text,
      // maxLines: 2,
      overflow: overflow,
      style: TextStyle(
        decoration: textDecoration ?? TextDecoration.none,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
      ),
    );
  }
}
