import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';

class BackIconWidgets extends StatelessWidget {
  const BackIconWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.mainColor60,
      radius: 18,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.mainColor,
            size: 18,
          ),
        ),
      ),
    );
  }
}
