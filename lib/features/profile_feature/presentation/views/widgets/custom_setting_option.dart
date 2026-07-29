import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/back_icon_widgets.dart';

class CustomSettingOption extends StatelessWidget {
  const CustomSettingOption({
    super.key,
    this.onTap,
    required this.text,
    required this.iconData,
    required this.supTitle,
  });
  final void Function()? onTap;
  final String text;
  final IconData iconData;
  final String supTitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          leading: Icon(iconData),
          title: Text(text, style: AppTextStyles.zekerTextBold18),
          subtitle: Text(supTitle, style: AppTextStyles.textGrey14),
        ),
      ),
    );
  }
}
