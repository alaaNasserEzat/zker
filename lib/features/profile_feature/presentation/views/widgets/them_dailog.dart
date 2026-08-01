import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/profile_feature/presentation/theme_cubit/theme_cubit.dart';

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
              child: const Text(
                'اختر سمة التطبيق',
                style: AppTextStyles.zekerTextBold18,
              ),
            ),
            content: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<ThemeMode>(
                    title: const Text('فاتح'),
                    value: ThemeMode.light,
                    groupValue: selectedTheme,
                    onChanged: (value) {
                      if (value != null) setState(() => selectedTheme = value);
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('داكن'),
                    value: ThemeMode.dark,
                    groupValue: selectedTheme,
                    onChanged: (value) {
                      if (value != null) setState(() => selectedTheme = value);
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('نظام الجهاز'),
                    value: ThemeMode.system,
                    groupValue: selectedTheme,
                    onChanged: (value) {
                      if (value != null) setState(() => selectedTheme = value);
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('إلغاء'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme(selectedTheme);
                  context.pop();
                },
                child: const Text('تطبيق'),
              ),
            ],
          );
        },
      );
    },
  );
}
