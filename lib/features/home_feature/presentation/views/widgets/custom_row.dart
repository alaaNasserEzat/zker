import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/l10n/app_localizations.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Row(
        spacing: 5,

        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.mainColor,
            child: Icon(
              Icons.favorite_border_outlined,
              size: 15,
              color: AppColors.orange,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.appTitle,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
