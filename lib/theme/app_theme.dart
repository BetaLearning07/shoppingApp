import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'styles.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 237, 237, 237),
    // primarySwatch: Colors.black,
    brightness: Brightness.light,
    highlightColor: Colors.transparent,
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24.0.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline3: TextStyle(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline4: TextStyle(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline5: TextStyle(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      headline6: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      subtitle2: TextStyle(
        fontSize: 13.0.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        fontSize: 11.0.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontSize: 11.0.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      button: TextStyle(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),

      labelMedium: TextStyle(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      overline: TextStyle(
        fontSize: 10.0.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      // titleSmall: TextStyle(
      //   fontSize: 16.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // titleMedium: TextStyle(
      //   fontSize: 16.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // titleLarge: TextStyle(
      //   fontSize: 16.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // bodyLarge: TextStyle(
      //   fontSize: 16.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // bodyMedium: TextStyle(
      //   fontSize: 16.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // bodySmall: TextStyle(
      //   fontSize: 16.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // displaySmall: TextStyle(
      //   fontSize: 20.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // displayMedium: TextStyle(
      //   fontSize: 60.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // displayLarge: TextStyle(
      //   fontSize: 80.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // headlineSmall: TextStyle(
      //   fontSize: 16.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // headlineMedium: TextStyle(
      //   fontSize: 16.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // headlineLarge: TextStyle(
      //   fontSize: 16.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // labelSmall: TextStyle(
      //   fontSize: 16.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // labelLarge: TextStyle(
      //   fontSize: 16.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // caption: TextStyle(
      //   fontSize: 16.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
      // overline: TextStyle(
      //   fontSize: 16.0.sp,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.black,
      // ),
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    elevation: .50,
    color: AppColors.primaryColor,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
    ),
  );
}
