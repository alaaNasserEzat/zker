import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_image.dart';
import 'package:zker/core/widgets/custom_shadow_contanier.dart';

class PrayerCard extends StatelessWidget {
  const PrayerCard({
    super.key,
    required this.icon,
    required this.text,
    required this.time,
    required this.isCur,
  });
  final String icon;
  final String text;
  final String time;
  final bool isCur;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomShadowContanier(
        color: isCur ? AppColors.mainColor40 : null,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            spacing: 10,
            children: [
              IconContainer(icon: icon),
              Text(text),
              Spacer(),
              Text(time),
            ],
          ),
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  const IconContainer({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          icon,
          width: 20,
          height: 20,
          color: false ? AppColors.orange : Colors.white,
        ),
      ),
    );
  }
}
