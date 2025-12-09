import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                "الاقسام ",
                    style: AppTextStyles.titles
                  ),
                  Text(
                  "مشاهده الكل",
                    style: AppTextStyles.titles
                  ),
                ],
              );
  }
}