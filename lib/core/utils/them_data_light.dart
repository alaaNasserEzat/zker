import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';

getLightThem(){
  return ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black
      )
    ),
    textTheme: ThemeData.light().textTheme.apply(bodyColor: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey
    ),
  );
}