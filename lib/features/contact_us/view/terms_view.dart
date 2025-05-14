import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_text_widget.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

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
          text: "Terms and Conditions",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xff204F38),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 23.h, right: 35.w, left: 13.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextWidget(
                textAlign: TextAlign.start,
                text:
                    "A Terms and Conditions agreement acts as a legal contractbetween you (the company) and the user.It’s where you ",
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              const CustomTextWidget(
                textAlign: TextAlign.start,
                text:
                    "maintain your rights to exclude users from your app in the event that they abuse your website/app, set out the rules for using your service and note other important details and disclaimers.",
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 42.h),
              const CustomTextWidget(
                textAlign: TextAlign.start,
                text:
                    "Having a Terms and Conditions agreement is completely optional. No laws require you to have one. Not even the super-strict and wide-reaching General Data Protection Regulation (GDPR).",
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 21.h),

              const CustomTextWidget(
                textAlign: TextAlign.start,
                text:
                    "Your Terms and Conditions agreement will be uniquely yours. While some clauses are standard and commonly seen in pretty much every Terms and Conditions agreement, it’s up to you to set the rules and guidelines that the user must agree to.",
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 21.h),

              const CustomTextWidget(
                textAlign: TextAlign.start,
                text:
                    "Terms and Conditions agreements are also known as Terms of Service or Terms of Use agreements. These terms are interchangeable, practically speaking. More rarely, it may be called something like an End User Services Agreement (EUSA).",
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 21.h),
            ],
          ),
        ),
      ),
    );
  }
}
