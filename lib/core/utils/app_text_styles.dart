import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';

class FontFamily {
  static final String cairo = "Cairo";
}

class AppTextStyles {
  static const TextStyle titles = TextStyle(
    fontSize: 24,
    fontFamily: "Nunito",
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
  static  TextStyle zekerTextBold17wihte = TextStyle(
    fontSize: 17,
    color: AppColors.white,
                 fontWeight: FontWeight.w500,
                  fontFamily:FontFamily.cairo ,
  );
}
