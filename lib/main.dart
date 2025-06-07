
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/services/notifications/local_notification_service.dart';
import 'package:task_one/core/services/notifications/onesignal_service.dart';
import 'package:task_one/core/utils/service_locator.dart';
import 'package:task_one/core/widgets/nav_bar_widget.dart';
import 'package:task_one/features/onboarding/views/onboarding.dart';
import 'package:task_one/firebase_options.dart';
import 'core/services/notifications/notification_services.dart';
import 'core/utils/shared_prefrences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // Choose icon color (light or dark)
    ),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();
  await SharedPrefs.init();
  Future.wait([
    NotificationServices.init(),
    LocalNotificationService.init(),
    OneSignalService.init(),
  ]);
  String? token = await SharedPrefs.getData(key: "token");
  runApp(
    MyApp(
      startScreen:
          token == null ? const OnBoardingView() : const NavigationBarWidget(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startScreen;
  const MyApp({super.key, required this.startScreen});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
              scaffoldBackgroundColor: Colors.white,
            ),

            debugShowCheckedModeBanner: false,
            home: child,
          ),
      child: startScreen,
    );
  }
}
