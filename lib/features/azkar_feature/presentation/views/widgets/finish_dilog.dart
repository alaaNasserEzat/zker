import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

void showFinishDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("🎉عاااااااش", textAlign: TextAlign.center),
        content: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            "  خلصت كل $text \nتقبل الله منك",
            textAlign: TextAlign.center,
            style: AppTextStyles.zekerTextBold18,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              "تم",
              style: AppTextStyles.zekerTextBold18.copyWith(
                color: AppColors.mainColor,
              ),
            ),
          ),
        ],
      );
    },
  );
}
