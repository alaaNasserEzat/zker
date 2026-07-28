import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/utils/app_image.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_colom.dart';

class HomeCategoryRow extends StatelessWidget {
  const HomeCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "title": "القرآن الكريم",
        "image": AppImage.quran,
        "route": AppRoutes.quran,
      },
      {
        "title": "ادعيه",
        "image": AppImage.dua,
        "route": AppRoutes.doaaCategoryView,
      },
      {
        "title": "ازكار",
        "image": AppImage.azkar,
        "route": AppRoutes.azkarCategoryView,
      },
      {"title": "سبحه", "image": AppImage.spha, "route": AppRoutes.sphaView},
      {
        "title": "اسماء الله",
        "image": AppImage.allah,
        "route": AppRoutes.nameOfAllahView,
      },
      {"title": "سنن الجمعه", "image": AppImage.mosque, "route": null},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 10,
        childAspectRatio: 7 / 6,
      ),
      itemBuilder: (context, index) {
        final item = items[index];

        return Card(
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: item["route"] != null
                ? () => context.push(item["route"] as String)
                : null,
            child: CustomColom(
              title: item["title"] as String,
              imagePath: item["image"] as String,
            ),
          ),
        );
      },
    );
  }
}
