import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/utils/app_image.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_colom.dart';
import 'package:zker/l10n/app_localizations.dart';

class HomeCategoryRow extends StatelessWidget {
  const HomeCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final items = [
      {
        "title": l10n.quranKarim,
        "image": AppImage.quran,
        "route": AppRoutes.quran,
      },
      {
        "title": l10n.doaa,
        "image": AppImage.dua,
        "route": AppRoutes.doaaCategoryView,
      },
      {
        "title": l10n.azkar,
        "image": AppImage.azkar,
        "route": AppRoutes.azkarCategoryView,
      },
      {
        "title": l10n.tasbih,
        "image": AppImage.spha,
        "route": AppRoutes.sphaView,
      },
      {
        "title": l10n.namesOfAllah,
        "image": AppImage.allah,
        "route": AppRoutes.nameOfAllahView,
      },
      {
        "title": l10n.sunnahOfFriday,
        "image": AppImage.mosque,
        "route": AppRoutes.fridaySunnahView,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
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
          color: Theme.of(context).cardColor,
          shadowColor: Colors.black26,
          elevation: 10,
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
