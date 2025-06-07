import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/utils/service_locator.dart';
import 'package:task_one/features/home/model/repos/home_repo_imp.dart';
import 'package:task_one/features/home/model_view/cubit/home_cubit.dart';

import '../../../core/services/colors/colors.dart';
import '../../../core/widgets/custom_text_widget.dart';
import 'filter_dialog_landscape.dart';
import 'home_portreit_view.dart';
import 'home_landscape_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

bool searchClicked = false;

class _HomeViewState extends State<HomeView> {
  List<String> cards = [
    "assets/restruants.png",
    "assets/farm.png",
    "assets/coffe.png",
    "assets/pharmcy.png",
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepoImp>())..getCategories(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: CustomTextWidget(
            text: "Fruit Market",
            fontSize:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 24
                    : 15,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (!searchClicked) {
                  setState(() {
                    searchClicked = !searchClicked;
                  });
                }
              },
              icon:
                  searchClicked
                      ? const Icon(Icons.notifications_outlined)
                      : Image.asset(
                        "assets/Icon feather-search.png",
                        width:
                            MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 25.w
                                : 14.w,
                      ),
            ),
            IconButton(
              onPressed: () {
                filterDialogLandScape(context);
              },
              icon: Image.asset(
                "assets/category_app_bar.png",
                width:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 25.w
                        : 14.w,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? PortreitView(cards: cards)
                  : LandScapeView(cards: cards),
        ),
      ),
    );
  }
}
