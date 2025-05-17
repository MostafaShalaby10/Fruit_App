import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors/colors.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const CustomTextWidget(
          text: "Fruit Market",
          fontSize: 24,
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
                      width: 25.w,
                    ),
          ),
          IconButton(
            onPressed: () {
              filterDialogLandScape(context);
            },
            icon: Image.asset("assets/category_app_bar.png", width: 25.w),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? PortreitView(cards: cards)
                : LandScapeView(cards: cards),
      ),
    );
  }
}
