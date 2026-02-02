import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zker/core/utils/app_colors.dart';

class SvgIconWidget extends StatelessWidget {
  const SvgIconWidget({super.key, required this.icon});
final String icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.mainColor40,
      radius: 28,
      child: SvgPicture.asset(icon, width: 30, height: 30,color: AppColors.mainColor,));
  }
}