
import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';

class AppTextStyles {
  static const TextStyle titles = TextStyle(
    fontSize: 24,
    fontFamily: "Nunito",
    fontVariations: [
      FontVariation('wght', 900),
    ],
  );

 static const TextStyle zekerTitle =  TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                );
}
