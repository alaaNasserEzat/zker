import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_library/quran.dart';
import 'package:zker/core/constent/extensions/localelization_extention.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_image.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/core/widgets/custom_shadow_contanier.dart';
import 'package:zker/l10n/app_localizations.dart';

class QuranWidget extends StatefulWidget {
  const QuranWidget({super.key});

  @override
  State<QuranWidget> createState() => _QuranWidgetState();
}

class _QuranWidgetState extends State<QuranWidget> {
  late final QuranLibrary quran;

  @override
  void initState() {
    super.initState();
    quran = QuranLibrary();
  }

  @override
  Widget build(BuildContext context) {
    final surahNumber = quran.currentPageNumber;
    print(surahNumber);
    final surah = quran
        .getAllSurahInPageByPageNumber(pageNumber: surahNumber)
        .first;

    return InkWell(
      onTap: () async {
        await context.push(AppRoutes.quran);
        if (mounted) {
          setState(() {});
        }
      },
      child: CustomShadowContanier(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SvgPicture.asset(AppImage.quran, width: 60),
              Image.asset(
                "assets/images/quran-removebg-preview.png",
                width: 90,
              ),
              Column(
                spacing: 3,
                children: [
                  Text(
                    AppLocalizations.of(context)!.continueFromWhereYouStopped,
                    style: AppTextStyles.textOrange14,
                  ),
                  Text(
                    "${surah.arabicName}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      spacing: 10,
                      children: [
                        Text(
                          context.l10n.reading,
                          style: AppTextStyles.textwhiht12,
                        ),

                        SvgPicture.asset(
                          AppImage.quran2,
                          width: 20,
                          color: AppColors.orange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
