import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/utils/app_image.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_category_entity.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/azkar_category_container.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/svg_icon_widget.dart';

class AzkerCategoryGridView extends StatelessWidget {
  const AzkerCategoryGridView({super.key, required this.categories});
  final List<AzkarCategoryEntity> categories;
  static List<String> azkarIcons = [
    AppImage.sun,
    AppImage.moon,
    AppImage.moonSleep,
    AppImage.sleepInBed,
    AppImage.water,
    AppImage.water,
    AppImage.home,
    AppImage.home,
    AppImage.mic,
    AppImage.ariPlan,
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.9,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return AzkarCategoryContainer(
            title: categories[index].category,
            onTap: () {
              context.push(AppRoutes.azkarDetails, extra: categories[index]);
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgIconWidget(icon: azkarIcons[index % azkarIcons.length]),
                    Text(
                      textAlign: TextAlign.center,
                      categories[index].category,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
