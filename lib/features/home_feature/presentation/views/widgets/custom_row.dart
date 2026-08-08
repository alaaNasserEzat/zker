import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/l10n/app_localizations.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Row(
        spacing: 5,

        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.auto_awesome_rounded,
                size: 15,
                color: AppColors.white,
              ),
            ),
          ),
          Text(text, style: Theme.of(context).textTheme.headlineLarge),
        ],
      ),
    );
  }
}
