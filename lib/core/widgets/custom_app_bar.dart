import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/core/utils/app_texts.dart';

buildAppBar({required context,String? title}) {
  return AppBar(
    backgroundColor: AppColors.white,
    title: Text(title?? AppTexts.appTitle, style: AppTextStyles.appBarTitle),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}