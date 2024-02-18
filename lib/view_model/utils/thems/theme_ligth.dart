import 'package:flutter/material.dart';
import 'package:news_app_with_api/view_model/utils/colors/colors.dart';

ThemeData themeLigth = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue,
    titleTextStyle: TextStyle(
      color: AppColor.white,
    ),
  ),
   searchBarTheme: SearchBarThemeData(
    backgroundColor: MaterialStatePropertyAll(AppColor.grey),
  ),
  scaffoldBackgroundColor: AppColor.white,
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 22,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
    ),
    bodySmall: TextStyle(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppColor.black,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontStyle: FontStyle.normal,
     
      color: AppColor.black,
    )
  ),
  iconTheme: IconThemeData(color: AppColor.black),
);
