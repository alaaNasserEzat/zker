import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_text_styles.dart';

Widget showNameDes(BuildContext context, String title, String des) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(30),
    ),
    title: Center(
      child: Text(
        title,
        style: AppTextStyles.zekerTextBold18.copyWith(fontSize: 24),
      ),
    ),
    content: Text(
      des,
      style: AppTextStyles.zekerTextBold18,
      textAlign: TextAlign.center,
    ),
  );
}
