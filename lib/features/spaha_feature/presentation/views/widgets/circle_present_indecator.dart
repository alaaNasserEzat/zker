import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';

class CirclePresentIndecator extends StatelessWidget {
  const CirclePresentIndecator({super.key, required this.sphaEntity, required this.ontap});
final SphaEntity sphaEntity;
final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:ontap,
      child: CircularPercentIndicator(
        addAutomaticKeepAlive: false,
        animateToInitialPercent: true,
        animateFromLastPercent: true,
        restartAnimation: false,
                  radius: 130.0,
                  animation: true,
                  animationDuration: 300,
                  lineWidth: 15.0,
             percent:
              (sphaEntity.currentcount / sphaEntity.beadsCount),

                  center:  Text(
                    sphaEntity.currentcount.toString(),
                    style:
                         TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: AppColors.mainColor,
                  progressColor: AppColors.white,
                ),
    );
  }
}