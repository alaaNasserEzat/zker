import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

buildAppBar(BuildContext context,String? title) {
  return AppBar(
    backgroundColor: AppColors.mainColor,
    title: Text(title?? "الازكار", style: AppTextStyles.zekerTitle),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}