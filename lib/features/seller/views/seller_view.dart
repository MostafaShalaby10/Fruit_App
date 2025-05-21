import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/colors/colors.dart';
import '../../../core/widgets/custom_text_widget.dart';
import 'seller_portreit_view.dart';
import 'seller_landscape_view.dart';

class SellerView extends StatefulWidget {
  const SellerView({super.key});

  @override
  State<SellerView> createState() => _SellerViewState();
}

class _SellerViewState extends State<SellerView> {
  bool searchClicked = false;

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
        backgroundColor: Colors.white,
        title: CustomTextWidget(
          text: "Fruit Market",
          fontSize:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 24
                  : 17,
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
        ],
      ),

      body: SingleChildScrollView(
        child:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? PortreitView(searchClicked: searchClicked)
                : LandScapeView(searchClicked: searchClicked),
      ),
    );
  }
}
