import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/constent/extensions/localelization_extention.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/core/utils/app_texts.dart';
import 'package:zker/features/profile_feature/presentation/language_cubit/app_locale.dart';
import 'package:zker/features/profile_feature/presentation/language_cubit/language_cubit.dart';
import 'package:zker/features/profile_feature/presentation/theme_cubit/theme_cubit.dart';
import 'package:zker/features/profile_feature/presentation/views/widgets/custom_setting_option.dart';
import 'package:zker/features/profile_feature/presentation/views/widgets/them_dailog.dart';
import 'package:zker/core/routs/app_routs.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //CustomListTile()
            Container(
              height: 100,
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: AppColors.mainColor.withOpacity(.90),
              ),
              child: Center(
                child: Text(
                  AppTexts.appTitle(context),
                  style: AppTextStyles.appBarTitle.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            BlocBuilder<LanguageCubit, Locale>(
              builder: (context, locale) {
                final languageTitle = locale == AppLocale.arabic
                    ? 'العربية'
                    : 'English';

                return CustomSettingOption(
                  iconData: Icons.language_outlined,
                  text: context.l10n.selectLanguage,
                  supTitle: languageTitle,
                  onTap: () => _showLanguageBottomSheet(context),
                );
              },
            ),
            CustomSettingOption(
              iconData: Icons.lock_outline,
              text: context.l10n.privacy,
              supTitle: context.l10n.privacyPolicy,
              onTap: () {},
            ),
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, state) {
                final themeSubtitle = state == ThemeMode.dark
                    ? '${context.l10n.theme}(${context.l10n.dark})'
                    : state == ThemeMode.light
                    ? '${context.l10n.theme}(${context.l10n.light})'
                    : '${context.l10n.theme}(${context.l10n.system})';

                return CustomSettingOption(
                  iconData: Icons.color_lens_outlined,
                  text: context.l10n.selectAppTheme,
                  supTitle: themeSubtitle,
                  onTap: () => showthemeDailog(context),
                );
              },
            ),
            CustomSettingOption(
              iconData: Icons.notifications_none,
              text: 'الإشعارات',
              supTitle: 'تخصيص تذكيرات الأذكار',
              onTap: () => context.push(AppRoutes.notifications),
            ),
            CustomSettingOption(
              iconData: Icons.info_outline_rounded,
              text: context.l10n.aboutApp,
              supTitle: context.l10n.aboutAppInfo,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'اختر اللغة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text('English'),
                trailing:
                    context.read<LanguageCubit>().state == AppLocale.english
                    ? Icon(Icons.check, color: AppColors.mainColor)
                    : null,
                onTap: () {
                  context.read<LanguageCubit>().changeLanguage(
                    AppLocale.english,
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('العربية'),
                trailing:
                    context.read<LanguageCubit>().state == AppLocale.arabic
                    ? Icon(Icons.check, color: AppColors.mainColor)
                    : null,
                onTap: () {
                  context.read<LanguageCubit>().changeLanguage(
                    AppLocale.arabic,
                  );
                  context.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
