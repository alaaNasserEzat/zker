import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

class EmptyFavouriteView extends StatelessWidget {
  const EmptyFavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Icon(Icons.favorite_border, size: 80, color: AppColors.mainColor),
          SizedBox(height: 12),
          Text(
            'لا يوجد عناصر في المفضلة',
            style: AppTextStyles.zekerTextBold18.copyWith(color: AppColors.mainColor),
          ),
        ],
      ),
    );
  }
}
