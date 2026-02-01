import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zker/core/utils/app_colors.dart';

class CustomColom extends StatelessWidget {
  const CustomColom({super.key, required this.title, required this.imagePath,required this.onTap});
  final String title;
  final String imagePath;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(imagePath, width: 30, height: 30,color: AppColors.mainColor,),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 16, ),
              ),
            ],
          ),
    );
  }
}