// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:task_one/features/basket/views/basket_view.dart';
// import 'package:task_one/features/home/views/home_view.dart';
// import 'package:task_one/features/orders/views/orders_view.dart';
// import 'package:task_one/features/profile/views/profile_view.dart';

// import 'core/colors/colors.dart';

// void main(List<String> args) {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,

//       home: MainScreen(),
//     );
//   }
// }

// class MainScreen extends StatefulWidget {
//   static final GlobalKey<_MainScreenState> mainScreenKey =
//       GlobalKey<_MainScreenState>();
//   final int initialTabIndex;
//   MainScreen({this.initialTabIndex = 0});
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//    int _selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _selectedIndex = 0; // Set initial tab
//   }

//   final List<GlobalKey<NavigatorState>> _navigatorKeys = [
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//   ];

//   void _onItemTapped(int index) {
//     if (_selectedIndex == index) {
//       _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
//       if (index == 2) {
//         _refreshOrdersTab();
//       }
//     } else {
//       setState(() {
//         _selectedIndex = index;
//         if (index == 2) {
//           _refreshOrdersTab();
//         }
//       });
//     }
//   }

//   void _refreshOrdersTab() {
//     final ordersNavigator = _navigatorKeys[2].currentState;
//     if (ordersNavigator != null) {
//       // Pop to root and let OrderScreen handle its own refresh
//       ordersNavigator.popUntil((route) => route.isFirst);
//       print("MainScreen: Refreshing Orders tab...");
//     }
//   }

//   Widget _buildOffstageNavigator(int index) {
//     return Offstage(
//       offstage: _selectedIndex != index,
//       child: Navigator(
//         key: _navigatorKeys[index],
//         onGenerateRoute: (routeSettings) {
//           return MaterialPageRoute(
//             builder: (context) {
//               if (index == 0) return const HomeView();
//               if (index == 1) return const BasketView();
//               if (index == 2) return const OrdersView();
//               return const HomeView();
//             },
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       onPopInvokedWithResult: (didPop, result) async {
//         if (!didPop) {
//           final isFirstRouteInCurrentTab =
//               !(await _navigatorKeys[_selectedIndex].currentState!.maybePop());
//           if (isFirstRouteInCurrentTab) {
//             if (_selectedIndex != 0) {
//               _onItemTapped(0);
//               return;
//             }
//           }
//         }
//       },
//       child: Scaffold(
//         body: Stack(
//           children: [
//             _buildOffstageNavigator(0),
//             _buildOffstageNavigator(1),
//             _buildOffstageNavigator(2),
//             _buildOffstageNavigator(3),
//           ],
//         ),
//         bottomNavigationBar: CustomBottomAppbar(
//           unSelectedColor: const Color(0xFF757575),
//           selectedColor: primaryColor,
//           onTap: _onItemTapped,
//           selectedTab: _selectedIndex,
//           children: [
//             CustomBottomAppBarItem(
//               svgIcon: mainIcon(
//                 _selectedIndex == 0 ? '60214E' : '757575',
//                 _selectedIndex == 0 ? '' : '757575',
//               ),
//               text: 'home',
//             ),
//             CustomBottomAppBarItem(
//               svgIcon: basketIcon(
//                 _selectedIndex == 1 ? '60214E' : '757575',
//                 _selectedIndex == 1 ? '' : '757575',
//               ),
//               text: 'cart',
//             ),
//             CustomBottomAppBarItem(
//               svgIcon: orderIcon(
//                 _selectedIndex == 2 ? '60214E' : '757575',
//                 _selectedIndex == 2 ? '' : '757575',
//               ),
//               text: 'myOrders',
//             ),
//             CustomBottomAppBarItem(
//               svgIcon: profileIcon(
//                 _selectedIndex == 3 ? '60214E' : '757575',
//                 _selectedIndex == 3 ? '' : '757575',
//               ),
//               text: 'profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomBottomAppbar extends StatelessWidget {
//   final Color selectedColor;
//   final Color unSelectedColor;
//   final Function(int index) onTap;
//   final List<CustomBottomAppBarItem> children;
//   final int selectedTab;

//   const CustomBottomAppbar({
//     Key? key,
//     required this.selectedColor,
//     required this.unSelectedColor,
//     required this.onTap,
//     required this.children,
//     required this.selectedTab,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 70, // Reduced height for a tighter look
//       padding: const EdgeInsets.symmetric(
//         horizontal: 10,
//       ), // Reduced horizontal padding
//       decoration: const BoxDecoration(color: Colors.white),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: List.generate(
//           children.length,
//           (index) => CustomBottomAppBarItem(
//             svgIcon: children[index].svgIcon,
//             text: children[index].text,
//             color: selectedTab == index ? selectedColor : unSelectedColor,
//             press: () => onTap(index),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomBottomAppBarItem extends StatelessWidget {
//   final Widget svgIcon;
//   final String text;
//   final VoidCallback? press;
//   final Color? color;

//   const CustomBottomAppBarItem({
//     Key? key,
//     required this.svgIcon,
//     required this.text,
//     this.press,
//     this.color,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: Container(
//         color: Colors.transparent,
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 20, // Fixed width for icons
//               height: 20, // Fixed height for icons
//               child: svgIcon,
//             ),
//             const SizedBox(height: 2), // Reduced space between icon and text
//             Text(text, style: TextStyle()),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget mainIcon(String fillColor, String borderColor) {
//   final String svgString = '''
//      <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
// <path d="M3.5 10.5V15.5C3.5 18.3284 3.5 19.7426 4.37868 20.6213C5.25736 21.5 6.67157 21.5 9.5 21.5H15.5C18.3284 21.5 19.7426 21.5 20.6213 20.6213C21.5 19.7426 21.5 18.3284 21.5 15.5V10.5" stroke="#${fillColor}" stroke-width="1.5" stroke-linecap="round"/>
// <path d="M15.5 17C14.8159 17.6072 13.7268 18 12.5 18C11.2732 18 10.1841 17.6072 9.5 17" stroke="#${fillColor}" stroke-width="1.5" stroke-linecap="round"/>
// <path d="M3.41199 5.23509L2.69806 5.0053H2.69806L3.41199 5.23509ZM2.72827 7.35933L3.44219 7.58912L2.72827 7.35933ZM21.588 5.23509L20.8741 5.46488V5.46488L21.588 5.23509ZM22.2717 7.35933L22.9857 7.12954L22.2717 7.35933ZM10.1564 9.77316C9.86534 9.47841 9.39047 9.47538 9.09572 9.7664C8.80096 10.0574 8.79793 10.5323 9.08895 10.827L10.1564 9.77316ZM15.9112 9.77261C15.6202 9.47778 15.1454 9.47464 14.8505 9.76559C14.5557 10.0565 14.5526 10.5314 14.8435 10.8262L15.9112 9.77261ZM2.87533 9.57004L3.48333 9.13091L3.48333 9.13091L2.87533 9.57004ZM11.3727 8.68818C11.4766 8.28722 11.2358 7.87792 10.8349 7.77399C10.4339 7.67006 10.0246 7.91085 9.92068 8.31182L11.3727 8.68818ZM17.1267 8.68818C17.2306 8.28722 16.9899 7.87792 16.5889 7.77399C16.1879 7.67006 15.7786 7.91085 15.6747 8.31182L17.1267 8.68818ZM22.1247 9.57004L21.5167 9.13091V9.13091L22.1247 9.57004ZM22.4735 8.70667L21.7325 8.59103V8.59103L22.4735 8.70667ZM2.5265 8.70667L1.78547 8.82231L2.5265 8.70667ZM4.55507 2.87752L4.10645 2.27649L4.10645 2.27649L4.55507 2.87752ZM2.69806 5.0053L2.01434 7.12954L3.44219 7.58912L4.12592 5.46488L2.69806 5.0053ZM20.8741 5.46488L21.5578 7.58912L22.9857 7.12954L22.3019 5.0053L20.8741 5.46488ZM7.07622 3.25H17.9238V1.75H7.07622V3.25ZM12.4993 10.75C11.5804 10.75 10.7518 10.3762 10.1564 9.77316L9.08895 10.827C9.95574 11.705 11.1646 12.25 12.4993 12.25V10.75ZM18.2547 10.75C17.3355 10.75 16.5066 10.376 15.9112 9.77261L14.8435 10.8262C15.7104 11.7046 16.9196 12.25 18.2547 12.25V10.75ZM6.7453 10.75C5.51112 10.75 4.17028 10.082 3.48333 9.13091L2.26733 10.0092C3.25148 11.3718 5.05603 12.25 6.7453 12.25V10.75ZM9.92068 8.31182C9.55796 9.71116 8.27553 10.75 6.7453 10.75V12.25C8.96912 12.25 10.841 10.7393 11.3727 8.68818L9.92068 8.31182ZM15.6747 8.31182C15.312 9.71116 14.0296 10.75 12.4993 10.75V12.25C14.7231 12.25 16.5951 10.7393 17.1267 8.68818L15.6747 8.31182ZM21.5167 9.13091C20.8297 10.082 19.4889 10.75 18.2547 10.75V12.25C19.944 12.25 21.7485 11.3718 22.7327 10.0092L21.5167 9.13091ZM21.5578 7.58912C21.7449 8.1704 21.7777 8.30138 21.7325 8.59103L23.2145 8.82231C23.3208 8.1415 23.1686 7.69774 22.9857 7.12954L21.5578 7.58912ZM22.7327 10.0092C22.8174 9.89189 22.9327 9.73648 23.0243 9.53046C23.117 9.32192 23.1717 9.09674 23.2145 8.82231L21.7325 8.59103C21.6996 8.80184 21.6709 8.88229 21.6536 8.92111C21.6353 8.96244 21.614 8.99609 21.5167 9.13091L22.7327 10.0092ZM22.3019 5.0053C22.0947 4.36137 21.9214 3.81957 21.7309 3.39553C21.5333 2.95545 21.2871 2.57024 20.8936 2.27649L19.9963 3.47854C20.1085 3.56231 20.2215 3.69586 20.3627 4.01018C20.5111 4.34054 20.6565 4.78877 20.8741 5.46488L22.3019 5.0053ZM17.9238 3.25C18.6135 3.25 19.0655 3.25121 19.4105 3.292C19.7346 3.33033 19.8863 3.39642 19.9963 3.47854L20.8936 2.27649C20.4978 1.9811 20.0607 1.85843 19.5866 1.80238C19.1333 1.74879 18.5777 1.75 17.9238 1.75V3.25ZM2.01434 7.12954C1.83145 7.69774 1.67923 8.1415 1.78547 8.82231L3.26753 8.59103C3.22233 8.30137 3.2551 8.1704 3.44219 7.58912L2.01434 7.12954ZM3.48333 9.13091C3.38596 8.99609 3.36474 8.96244 3.34636 8.92111C3.32911 8.88229 3.30043 8.80184 3.26753 8.59103L1.78547 8.82231C1.8283 9.09674 1.883 9.32192 1.97571 9.53046C2.0673 9.73648 2.18263 9.89189 2.26733 10.0092L3.48333 9.13091ZM4.12592 5.46488C4.34354 4.78877 4.48895 4.34054 4.63735 4.01018C4.77854 3.69586 4.89148 3.56231 5.0037 3.47854L4.10645 2.27649C3.71291 2.57024 3.46674 2.95545 3.26906 3.39553C3.07858 3.81957 2.90532 4.36137 2.69806 5.0053L4.12592 5.46488ZM7.07622 1.75C6.4223 1.75 5.86666 1.74879 5.4134 1.80238C4.93932 1.85843 4.50218 1.9811 4.10645 2.27649L5.0037 3.47854C5.11373 3.39642 5.26536 3.33033 5.58952 3.292C5.93449 3.25121 6.38655 3.25 7.07622 3.25V1.75Z" fill="#${fillColor}"/>
// </svg>

//     ''';

//   return SvgPicture.string(svgString, width: 18, height: 20);
// }

// Widget basketIcon(String fillColor, String borderColor) {
//   final String svgString = '''
//      <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
// <path d="M12 8H20.696C21.3208 8 21.6332 8 21.8619 8.10084C22.8736 8.5469 22.4213 9.67075 22.2511 10.4784C22.2205 10.6235 22.121 10.747 21.9816 10.8132C21.4033 11.0876 20.9982 11.6081 20.8919 12.2134L20.2993 15.5878C20.0386 17.0725 19.9495 19.1943 18.6484 20.2402C17.6938 21 16.3184 21 13.5675 21H11.4325C8.68162 21 7.3062 21 6.3516 20.2402C5.05052 19.1942 4.96138 17.0725 4.70066 15.5878L4.10807 12.2134C4.00177 11.6081 3.59673 11.0876 3.01841 10.8132C2.87896 10.747 2.77952 10.6235 2.74894 10.4784C2.57874 9.67075 2.1264 8.5469 3.13812 8.10084C3.36684 8 3.67922 8 4.30397 8H8" stroke="#${fillColor}" stroke-width="1.5" stroke-linecap="round"/>
// <path d="M14.5 12L10.5 12" stroke="#${fillColor}" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
// <path d="M7 11L10.5 3M15.5 3L18 8" stroke="#${fillColor}" stroke-width="1.5" stroke-linecap="round"/>
// </svg>

//     ''';

//   return SvgPicture.string(svgString, width: 18, height: 20);
// }

// Widget orderIcon(String fillColor, String borderColor) {
//   final String svgString = '''
//     <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
// <path d="M11.5 22L10.0216 19.6461C8.99181 18.0065 8.47692 17.1867 7.66053 17.0393C6.33152 16.7993 4.95794 17.7045 4 18.509" stroke="#${fillColor}" stroke-width="1.5"/>
// <path d="M4 9V16.0279C4 17.2307 4 17.8321 4.2987 18.3154C4.5974 18.7987 5.13531 19.0677 6.21115 19.6056L10.1554 21.5777C10.9962 21.9981 11.0043 22 11.9443 22H15C17.8284 22 19.2426 22 20.1213 21.1213C21 20.2426 21 18.8284 21 16V9C21 6.17157 21 4.75736 20.1213 3.87868C19.2426 3 17.8284 3 15 3H10C7.17157 3 5.75736 3 4.87868 3.87868C4 4.75736 4 6.17157 4 9Z" stroke="#${fillColor}" stroke-width="1.5"/>
// <path d="M12.5 9H8.5M16.5 14H8.5" stroke="#${fillColor}" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
// <path d="M17.5 2V4M12.5 2V4M7.5 2V4" stroke="#${fillColor}" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
// </svg>

//     ''';

//   return SvgPicture.string(svgString, width: 18, height: 20);
// }

// Widget profileIcon(String fillColor, String borderColor) {
//   final String svgString = '''
//     <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
// <path d="M12.6601 10.87C12.5601 10.86 12.4401 10.86 12.3301 10.87C9.95006 10.79 8.06006 8.84 8.06006 6.44C8.06006 3.99 10.0401 2 12.5001 2C14.9501 2 16.9401 3.99 16.9401 6.44C16.9301 8.84 15.0401 10.79 12.6601 10.87Z" stroke="#${fillColor}" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
// <path d="M7.66021 14.56C5.24021 16.18 5.24021 18.82 7.66021 20.43C10.4102 22.27 14.9202 22.27 17.6702 20.43C20.0902 18.81 20.0902 16.17 17.6702 14.56C14.9302 12.73 10.4202 12.73 7.66021 14.56Z" stroke="#${fillColor}" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
// </svg>

//     ''';

//   return SvgPicture.string(svgString, width: 18, height: 20);
// }
