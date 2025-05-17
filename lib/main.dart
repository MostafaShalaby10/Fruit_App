import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/features/onboarding/views/onboarding.dart';
import 'package:task_one/features/splash/view/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // Choose icon color (light or dark)
    ),
  );
  runApp(
const MyApp()  );
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
