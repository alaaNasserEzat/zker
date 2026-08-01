import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';

class CustomShadowContanier extends StatelessWidget {
  const CustomShadowContanier({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(.5, .5),
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}
