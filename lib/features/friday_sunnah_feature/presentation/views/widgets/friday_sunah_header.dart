import 'package:flutter/material.dart';
import 'package:zker/core/constent/extensions/localelization_extention.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

class FridaySunnahHeader extends StatelessWidget {
  const FridaySunnahHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          "assets/images/friday_sunnah_imag.jpeg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
