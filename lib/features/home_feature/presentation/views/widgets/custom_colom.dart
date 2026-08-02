import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

class CustomColom extends StatelessWidget {
  const CustomColom({super.key, required this.title, required this.imagePath});
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: SvgPicture.asset(
              imagePath,
              width: 30,
              height: 30,
              color: AppColors.orange,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
