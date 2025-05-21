import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopfee_app/route/route_constants.dart';
import 'package:shopfee_app/route/router.dart' as router;
import 'package:shopfee_app/theme/app_theme.dart';

void main() {
  runApp(ScreenUtilInit(
      designSize: const Size(375, 812), // Figma design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Template by The Flutter Way',
      theme: AppTheme.lightTheme(context),
      // Dark theme is inclided in the Full template
      themeMode: ThemeMode.dark,
      onGenerateRoute: router.generateRoute,
      initialRoute: splashScreenRoute,
    );
  }
}

