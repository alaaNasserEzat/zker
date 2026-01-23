import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.title, required this.onTap,this.width,this.height});
final String title;
final VoidCallback onTap;
 final double ?width;
final double? height;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        
      },
      child: Container(
        width:width?? double.infinity,
        height: height,
        padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(.5, .5),blurRadius: 10)],
        gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: [AppColors.mainColor,AppColors.mainColor,AppColors.pink,AppColors.white],
        ),
      ),
      child: Center(child: Text(title,style: AppTextStyles.titles.copyWith(color: AppColors.mainColor),)),
      ),
    );
  }
}