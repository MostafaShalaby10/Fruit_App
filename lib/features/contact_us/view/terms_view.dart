import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/service_locator.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../model/repos/contact_repo_imp.dart';
import '../model_view/cubit/contact_cubit.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (context) => ContactCubit(getIt<ContactRepoImp>())..getTerms(),
      child: BlocBuilder<ContactCubit, ContactState>(
        builder: (context, state) {
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
                    CustomTextWidget(
                      textAlign: TextAlign.start,
                      text: ContactCubit.get(context).data["details"],
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                      ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
