import 'package:flutter/material.dart';
import 'package:task_one/features/home/views/home_view.dart';
import 'package:task_one/features/profile/views/profile_view.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});
  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int _index = 0;
  List<Widget> pages = [
    const HomeView() , 
    const HomeView() , 
    const HomeView() , 
    const HomeView() , 
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _index,
      onTap: (index) {
        setState(() {
          _index = index;
        });
      },
      selectedLabelStyle: const TextStyle(color: Color(0xff204F38)),
      unselectedLabelStyle: const TextStyle(color: Color(0xff919CAA)),

      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/home_icon.png",
            color: const Color(0xff204F38),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/category_icon.png",
            color: const Color(0xff204F38),
          ),
          label: "Orders",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/cart_icon.png",
            color: const Color(0xff204F38),
          ),
          label: "Basket",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/favorite_icon.png",
            color: const Color(0xff204F38),
          ),
          label: "Favorite",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/more_icon.png",
            color: const Color(0xff204F38),
          ),
          label: "More",
        ),
      ],
    ),
    body:pages[_index] ,
    );
  }
}
