import 'package:flutter/material.dart';
import 'package:news_app_with_api/view_model/utils/colors/colors.dart';

ThemeData themeDark = ThemeData(
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  searchBarTheme: SearchBarThemeData(
    backgroundColor: MaterialStatePropertyAll(AppColor.grey),
  ),
  scaffoldBackgroundColor: AppColor.black,
   textTheme:  TextTheme(
    bodyLarge: TextStyle(
      fontSize: 22,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color:AppColor.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
        color:AppColor.white,
    ),
    bodySmall: TextStyle(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
        color:AppColor.white,
    ),
     titleSmall: TextStyle(
      fontSize: 16,
      fontStyle: FontStyle.normal,

      color: AppColor.white,
    )
  ),
  iconTheme: IconThemeData(color: AppColor.white),
);