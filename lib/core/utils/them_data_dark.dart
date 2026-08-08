import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

getDarkThem() {
  return ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.mainDarkColor,
    colorScheme: ColorScheme.dark(
      primaryContainer: AppColors.primaryDarkContainerColor,
      surfaceContainer: AppColors.mainDarkColor.withOpacity(.90),
      brightness: Brightness.dark,
      primary: AppColors.primaryDarkColor,
      onPrimary: AppColors.mainColor70,
      surface: AppColors.cardDark,
    ),
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDarkContainerColor,
      foregroundColor: AppColors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.white),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
      titleLarge: AppTextStyles.titleLarage.copyWith(color: AppColors.white),
      headlineLarge: AppTextStyles.headLineLarage.copyWith(
        color: AppColors.white,
      ),
      bodySmall: AppTextStyles.bodySmall,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainDarkColor,
      foregroundColor: AppColors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    cardColor: AppColors.cardDark,
    cardTheme: CardThemeData(
      color: AppColors.cardDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    dialogTheme: DialogThemeData(backgroundColor: AppColors.cardDark),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.blueGrey,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
    iconTheme: IconThemeData(color: AppColors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonDark,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
    ),

    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.mainColor;
        } else {
          return AppColors.black;
        }
      }),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(color: AppColors.mainColor),
      ),
    ),
  );
}
