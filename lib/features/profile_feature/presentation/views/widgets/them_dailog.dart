import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/profile_feature/presentation/theme_cubit/theme_cubit.dart';
import 'package:zker/l10n/app_localizations.dart';

Future<void> showthemeDailog(BuildContext context) {
  final currentTheme = context.read<ThemeCubit>().state;

  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      ThemeMode selectedTheme = currentTheme;

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Center(
              child: Text(
                AppLocalizations.of(context)!.selectAppTheme,
                style: AppTextStyles.zekerTextBold18,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<ThemeMode>(
                  title: Text(AppLocalizations.of(context)!.light),
                  value: ThemeMode.light,
                  groupValue: selectedTheme,
                  onChanged: (value) {
                    if (value != null) setState(() => selectedTheme = value);
                  },
                ),
                RadioListTile<ThemeMode>(
                  title: Text(AppLocalizations.of(context)!.dark),
                  value: ThemeMode.dark,
                  groupValue: selectedTheme,
                  onChanged: (value) {
                    if (value != null) setState(() => selectedTheme = value);
                  },
                ),
                RadioListTile<ThemeMode>(
                  title: Text(AppLocalizations.of(context)!.system),
                  value: ThemeMode.system,
                  groupValue: selectedTheme,
                  onChanged: (value) {
                    if (value != null) setState(() => selectedTheme = value);
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: Text(AppLocalizations.of(context)!.cancel),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme(selectedTheme);
                  context.pop();
                },
                child: Text(AppLocalizations.of(context)!.apply),
              ),
            ],
          );
        },
      );
    },
  );
}
