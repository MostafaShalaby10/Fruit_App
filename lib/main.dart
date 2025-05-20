import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:task_one/core/services/notifications/local_notification_service.dart';
import 'package:task_one/core/services/notifications/onesignal_service.dart';
import 'package:task_one/features/onboarding/views/onboarding.dart';
import 'package:task_one/features/splash/view/splash_view.dart';
import 'package:task_one/firebase_options.dart';

import 'core/services/notifications/notification_services.dart';

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

  Future.wait([NotificationServices.init(), LocalNotificationService.init()]);
  await OneSignalService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      child: const SplashView(),
    );
  }
}
