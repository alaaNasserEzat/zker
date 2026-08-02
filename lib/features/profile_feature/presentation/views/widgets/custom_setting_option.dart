import 'package:flutter/material.dart';

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
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        leading: Icon(iconData),
        title: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 18),
        ),
        subtitle: Text(supTitle, style: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }
}
