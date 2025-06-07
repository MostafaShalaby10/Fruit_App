
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/widgets/custom_button_widget.dart';
import 'package:task_one/core/widgets/custom_text_widget.dart';
import 'package:task_one/features/profile/view_model/cubit/profile_cubit.dart';
import 'package:task_one/features/profile/views/edit_data.dart';
import 'language_dialog.dart';

class PortreitView extends StatelessWidget {
  const PortreitView({super.key, required this.titles, required this.icons});

  final List<String> titles;
  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is SuccessfullyGetDataState) {}
      },
      builder: (context, state) {
        return state is! LoadingGetDataState &&
                state is SuccessfullyGetDataState
            ? SingleChildScrollView(
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

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://masool.net/fruits-app/public/uploads/${state.data.data?.profilePhotoPath}",
                        ),
                      ),
                    ),
                  ),
                  CustomTextWidget(
                    text: "Welcome, ${state.data.data?.name!.split(" ").first}",
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 28.h, bottom: 18.h),
                    child: SizedBox(
                      width: 347.w,
                      height: 51.h,
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
                              height: 56.h,
                              color: const Color(0xffFEFEFE),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
            )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
