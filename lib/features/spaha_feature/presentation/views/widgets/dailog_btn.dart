import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

class DailogBtn extends StatelessWidget {
  const DailogBtn({super.key, this.onPressed, required this.text});
final void Function() ?onPressed; 
final String text;
  @override
  Widget build(BuildContext context) {
    return   // Add
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                
              ),
            ),
            onPressed:onPressed,
            child: Text(text,style: AppTextStyles.zekerTitle.copyWith(fontSize: 15),),
          );
  }
}