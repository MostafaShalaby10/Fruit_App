import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/widgets/custom_button_widget.dart';
import 'package:task_one/core/widgets/custom_text_widget.dart';
import 'package:task_one/features/profile/views/edit_data.dart';
import 'language_dialog.dart';

class LandScapeView extends StatelessWidget {
  const LandScapeView({super.key, required this.titles, required this.icons});
  final List<String> titles;
  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 90.w,
                height: 90.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                ),

                child: const Icon(Icons.person_outline_rounded, size: 35),
              ),
              const CustomTextWidget(
                text: "Welcome, Fruit Market",
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: CustomButtonWidget(
                  text: "Login",
                  function: () {},
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: titles.length,
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 17.w),
                    child: InkWell(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditData(),
                            ),
                          );
                        } else if (index == 3) {
                          languageDialog(context);
                        }
                      },
                      child: Container(
                        width: 393.w,
                        height: 90.h,
                        color: const Color(0xffFEFEFE),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: 20.w,
                                bottom: 10.h,
                              ),
                              child: Image.asset(
                                icons[index],
                                width: 15.w,
                                color: const Color(0xff204F38),
                              ),
                            ),
                            Expanded(
                              child: CustomTextWidget(
                                textAlign: TextAlign.start,
                                text: titles[index],
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xff858D9A),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
  
*/