import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';

class FontFamily {
  static final String cairo = "Cairo";
}

class AppTextStyles {
  static const TextStyle titles = TextStyle(
    fontSize: 24,
    fontFamily: "Nunito",
    color: AppColors.mainColor,
    fontVariations: [FontVariation('wght', 900)],
  );

  static TextStyle zekerTitle = TextStyle(
    fontSize: 34,

    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.cairo,
  );
  static TextStyle appBarTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.cairo,
    color: AppColors.mainColor,
  );
  static const TextStyle zekerTextBold18 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,

    color: AppColors.black,
  );
  static TextStyle zekerTextBold17wihte = TextStyle(
    fontSize: 17,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.cairo,
  );
  // static TextStyle zekerTextBold17main = TextStyle(
  //   fontSize: 17,
  //   color: AppColors.mainColor,
  //   fontWeight: FontWeight.w700,
  // );
  static TextStyle textButtonStyle = TextStyle(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMain15 = TextStyle(
    color: AppColors.mainColor,
    fontSize: 15,
  );
  static TextStyle textOrange14 = TextStyle(
    color: AppColors.orange,
    fontSize: 14,
  );
  static TextStyle textGrey14 = TextStyle(color: AppColors.grey, fontSize: 14);
  static TextStyle textOrange18 = TextStyle(
    color: AppColors.orange,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.cairo,
  );
  static TextStyle textwhiht12 = TextStyle(color: Colors.white, fontSize: 14);

  static TextStyle bodyLarge = TextStyle(
    fontSize: 15,
    color: AppColors.mainColor,
  );
  static TextStyle lableLarge = TextStyle(fontSize: 15, color: AppColors.white);
  static TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.cairo,
    color: AppColors.black,
  );
  static TextStyle bodySmall = TextStyle(fontSize: 14, color: AppColors.grey);
  static TextStyle titleLarage = TextStyle(
    fontSize: 17,
    color: AppColors.mainColor,
    fontWeight: FontWeight.w700,
  );
  static TextStyle headLineLarage = TextStyle(
    fontSize: 22,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle titleMedium = TextStyle(
    fontSize: 20,
    color: AppColors.mainColor,
  );
  static TextStyle cardTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.cairo,
  );
  //text small
  static TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.cairo,
  );
}
