import 'package:flutter/material.dart';

import '../constants/constants.dart';
// import 'checkbox_themedata.dart';
import 'theme_data.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: "Plus Jakarta",
      //primarySwatch: ,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: blackColor),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: blackColor40),
      ),
      // elevatedButtonTheme: elevatedButtonThemeData,
      // textButtonTheme: textButtonThemeData,
      // outlinedButtonTheme: outlinedButtonTheme(),
      // inputDecorationTheme: lightInputDecorationTheme,
      // checkboxTheme: checkboxThemeData.copyWith(
      //   side: const BorderSide(color: blackColor40),
      // ),
      appBarTheme: appBarLightTheme,
      // scrollbarTheme: scrollbarThemeData,
      // dataTableTheme: dataTableLightThemeData,
    );
  }

}
