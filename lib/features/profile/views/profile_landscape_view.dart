import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/widgets/custom_button_widget.dart';
import 'package:task_one/core/widgets/custom_text_widget.dart';
import 'package:task_one/features/profile/views/edit_data.dart';
import '../../home/views/home_view.dart';
import 'language_dialog.dart';

class LandScapeView extends StatelessWidget {
  const LandScapeView({super.key, required this.titles, required this.icons});
  final List<String> titles;
  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Profile",
      "My Orders",
      "Favorite",
      "Language",
      "Support",
      "Terms & Conditions",
      "About Us",
    ];
    List<String> icons = [
      "assets/user.png",
      "assets/category_icon.png",
      "assets/favorite_icon.png",
      "assets/languages.png",
      "assets/headphone.png",
      "assets/money.png",
      "assets/info.png",
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomTextWidget(
          text: "Fruit Market",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xff204F38),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
              (route) => false,
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 40.h,
                bottom: 16.h,
                left: 165.w,
                right: 175.w,
              ),
              child: Container(
                width: 90.w,
                height: 90.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                ),

                child: const Icon(Icons.person_outline_rounded, size: 35),
              ),
            ),
            const CustomTextWidget(
              text: "Welcome, Fruit Market",
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
            Padding(
              padding: EdgeInsets.only(top: 28.h, bottom: 18.h),
              child: SizedBox(
                width: 347.w,
                height: 80.h,
                child: CustomButtonWidget(
                  text: "Login",
                  function: () {},
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
                                width: 32.w,
                                color: const Color(0xff204F38),
                              ),
                            ),
                            Expanded(
                              child: CustomTextWidget(
                                textAlign: TextAlign.start,
                                text: titles[index],
                                fontSize: 14,
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
          ],
        ),
      ),
    );
  }
}
