import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_container.dart';

class AzkarView extends StatelessWidget {
  final String title;
  AzkarView({super.key, required this.title});
  final List<AzkarCategoryModel> azkarCategories = [
    AzkarCategoryModel(
      title: "أذكار الصباح",
      emoji: "🌅",
      routeParam: "morning",
    ),
    AzkarCategoryModel(
      title: "أذكار المساء",
      emoji: "🌙",

      routeParam: "evening",
    ),
    AzkarCategoryModel(title: "أذكار النوم", emoji: "🛏️", routeParam: "sleep"),
    AzkarCategoryModel(
      title: "أذكار بعد الصلاة",
      emoji: "🕌",

      routeParam: "after-prayer",
    ),
    AzkarCategoryModel(title: "أذكار عامة", emoji: "🤲", routeParam: "general"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,title ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 9 / 8,
              ),
              itemCount: azkarCategories.length,
              itemBuilder: (context, index) {
                final item = azkarCategories[index];

                return CustomContainer(
                  title:item.title ,
                  widget: '${AppRoutes.azkarDetails}',
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ✅ الإيموجي
                      Text(item.emoji, style: const TextStyle(fontSize: 36)),
                
                      const SizedBox(height: 10),
                
                      // ✅ اسم الذكر
                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AzkarCategoryModel {
  final String title;
  final String emoji;

  final String routeParam;

  AzkarCategoryModel({
    required this.title,
    required this.emoji,

    required this.routeParam,
  });
}


