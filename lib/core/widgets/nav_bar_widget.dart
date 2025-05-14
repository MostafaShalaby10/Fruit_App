import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:task_one/features/basket/views/basket_view.dart';
import 'package:task_one/features/home/views/home_view.dart';
import 'package:task_one/features/orders/views/orders_view.dart';
import 'package:task_one/features/profile/views/profile_view.dart';

import '../../features/favorite/views/favorite_view.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});
  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int index = 0;
  List<Widget> pages = [
    const HomeView(),
    const OrdersView(),
    const BasketView(),
    const FavoriteView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:GNav(
        selectedIndex: index,
        onTabChange: (value) {
          setState(() {
            index = value;
          });
        },
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        haptic: true,
        tabBorderRadius: 25,
        tabActiveBorder: Border.all(color: const Color(0xff204F38), width: 6.w),
        backgroundColor: const Color(0xff204F38),
        tabBackgroundColor: Colors.white,
        color: Colors.white,
        activeColor: const Color(0xff204F38),
        iconSize: 24,
        padding: EdgeInsets.only(
          left: 2.w,
          right: 0.w,
          top: 0.h,
          bottom: 0.h,
        ), // navigation bar padding
        tabs: [
          GButton(
            leading: Image.asset(
              "assets/home_icon.png",
              color: index == 0 ? const Color(0xff204F38) : Colors.white,
            ),
            icon: Icons.home,
            iconColor: const Color(0xff204F38),
            text: 'Home',
          ),
          GButton(
            leading: Image.asset(
              "assets/category_icon.png",
              color: index == 1 ? const Color(0xff204F38) : Colors.white,
            ),
            icon: Icons.home,
            text: 'Orders',
          ),
          GButton(
            leading: Image.asset(
              "assets/cart_icon.png",
              color: index == 2 ? const Color(0xff204F38) : Colors.white,
            ),
            icon: Icons.home,
            text: 'Basket',
          ),
          GButton(
            leading: Image.asset(
              "assets/favorite_icon.png",
              color: index == 3 ? const Color(0xff204F38) : Colors.white,
            ),
            icon: Icons.home,
            text: 'Favorite',
          ),
          GButton(
            leading: Image.asset(
              "assets/more_icon.png",
              color: index == 4 ? const Color(0xff204F38) : Colors.white,
            ),
            icon: Icons.home,
            text: 'More',
          ),
        ],
      ),
      body: pages[index],
    );
  }
}
