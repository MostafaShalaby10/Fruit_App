import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/widgets/custom_button_widget.dart';

import '../../../core/widgets/custom_text_widget.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        centerTitle: true,
        title: const CustomTextWidget(
          text: "Contact Us",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xff204F38),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 41.w, right: 41.w, top: 24.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                label: "Name",
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 51.h
                        : 100.h,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                label: "Mobile Number",
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 51.h
                        : 100.h,
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                label: "Message",
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 110.h
                        : 200.h,
              ),

              SizedBox(height: 21.h),
              SizedBox(
                width: 347.w,
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 51.h
                        : 80.h,
                child: CustomButtonWidget(
                  text: "Submit",
                  function: () {},
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 27.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ContactIcon(image: "assets/whatsapp.png"),
                  ContactIcon(image: "assets/faceIcon.png"),
                  ContactIcon(image: "assets/instagram.png"),
                  ContactIcon(image: "assets/youtube.png"),
                ],
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.label, required this.height});
  final String label;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: label,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xff858D9A),
        ),
        SizedBox(height: 16.h),
        Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.r),
            boxShadow: [
              BoxShadow(blurRadius: 4, color: Colors.black.withOpacity(.25)),
            ],
          ),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 18.w,
                vertical: 10.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ContactIcon extends StatelessWidget {
  const ContactIcon({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height:
          MediaQuery.of(context).orientation == Orientation.portrait
              ? 51.h
              : 80.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 0.55),
      ),
      child: Image.asset(image, width: 25.w, height: 25.h),
    );
  }
}
