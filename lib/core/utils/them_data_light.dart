import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

getLightThem() {
  return ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.mainColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.mainColor),
    ),
    colorScheme: ColorScheme.light(
      surface: AppColors.white,
      surfaceContainer: AppColors.mainColor.withOpacity(.90),
      brightness: Brightness.light,
      primary: AppColors.mainColor,
    ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      titleLarge: AppTextStyles.titleLarage,
      headlineLarge: AppTextStyles.headLineLarage,
      bodySmall: AppTextStyles.bodySmall,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.mainColor,
      unselectedItemColor: Colors.grey,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(color: AppColors.mainColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.mainColor),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.mainColor;
        } else {
          return AppColors.black;
        }
      }),
    ),
  );
}
