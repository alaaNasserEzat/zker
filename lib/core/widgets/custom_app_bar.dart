import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/core/utils/app_texts.dart';

buildAppBar({required context, String? title}) {
  return AppBar(
    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    title: Text(
      title ?? AppTexts.appTitle(context),
      style: AppTextStyles.appBarTitle.copyWith(
        color: Theme.of(context).appBarTheme.foregroundColor,
      ),
    ),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Theme.of(context).appBarTheme.foregroundColor,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
