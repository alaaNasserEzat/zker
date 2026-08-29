import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';

class LinearProgress extends StatelessWidget {
  const LinearProgress({super.key, required this.value});
  final double value;
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,

      ///  minHeight: 8,
      backgroundColor: AppColors.mainColor40,
    );
  }
}
