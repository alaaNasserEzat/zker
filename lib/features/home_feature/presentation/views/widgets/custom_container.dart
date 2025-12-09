import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final String widget;
  final Widget child;
  final String title;
  const CustomContainer({super.key, required this.widget, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(widget, extra: title);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.pink, AppColors.darkPink, AppColors.white],
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, .2),
              blurRadius: 10,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
