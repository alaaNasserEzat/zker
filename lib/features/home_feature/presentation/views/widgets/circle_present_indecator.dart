import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zker/core/utils/app_colors.dart';

class CirclePresentIndecator extends StatelessWidget {
  const CirclePresentIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return  CircularPercentIndicator(
                radius: 130.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 15.0,
                percent: 1,
                center: new Text(
                  "33",
                  style:
                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: AppColors.mainColor,
                progressColor: AppColors.white,
              );
  }
}