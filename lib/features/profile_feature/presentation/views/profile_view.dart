import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/core/utils/app_texts.dart';
import 'package:zker/features/profile_feature/presentation/views/widgets/custom_list_tile.dart';
import 'package:zker/features/profile_feature/presentation/views/widgets/custom_setting_option.dart';

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
                  AppTexts.appTitle,
                  style: AppTextStyles.appBarTitle.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            CustomSettingOption(
              iconData: Icons.language_outlined,
              text: "اختر لغه التطبيق",
              supTitle: "العربيه",
              onTap: () {},
            ),
            CustomSettingOption(
              iconData: Icons.lock_outline,
              text: "الخصوصيه",
              supTitle: "لمعرفه سياسه التطبيق",
              onTap: () {},
            ),
            CustomSettingOption(
              iconData: Icons.color_lens_outlined,
              text: "السمه",
              supTitle: "سمه التطبيق (فاتح)",
              onTap: () {},
            ),
            CustomSettingOption(
              iconData: Icons.info_outline_rounded,
              text: "حول التطبيق ",
              supTitle: "معلومات عن التطبيق",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
