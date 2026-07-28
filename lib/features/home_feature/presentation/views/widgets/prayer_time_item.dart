import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem({
    super.key,
    required this.text,
    required this.time,
    required this.img,
    this.iscurrentPrayer = false,
  });
  final String text;
  final String img;
  final String time;
  final bool iscurrentPrayer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withOpacity(0.15),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      color: iscurrentPrayer ? AppColors.orange : Colors.white,
                    ),
                  ),

                  SvgPicture.asset(
                    img,
                    width: 25,
                    height: 25,
                    color: iscurrentPrayer ? AppColors.orange : Colors.white,
                  ),

                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: iscurrentPrayer ? AppColors.orange : Colors.white,
                      fontFamily: FontFamily.cairo,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
