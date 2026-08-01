import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/widgets/custom_shadow_contanier.dart';

class AzkarCategoryContainer extends StatelessWidget {
  const AzkarCategoryContainer({
    super.key,
    required this.child,
    required this.title,
    required this.onTap,
  });
  final Widget child;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomShadowContanier(child: child),
    );
  }
}
