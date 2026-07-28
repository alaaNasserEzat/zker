import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Row(
        spacing: 5,
        textDirection: TextDirection.rtl,

        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.mainColor,
            child: Icon(
              Icons.favorite_border_outlined,
              size: 15,
              color: AppColors.orange,
            ),
          ),
          Text("العبادات", style: AppTextStyles.titles),
          //  Text("مشاهده الكل", style: AppTextStyles.titles),
        ],
      ),
    );
  }
}
