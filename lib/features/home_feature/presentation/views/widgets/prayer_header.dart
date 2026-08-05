import 'package:flutter/material.dart';
import 'package:zker/core/constent/extensions/localelization_extention.dart';
import 'package:zker/core/services/location_service.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/home_feature/data/models/prayer_date.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/container_image_background.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/location_name_bloc_builder.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_row_widget.dart';

class PrayerHeader extends StatelessWidget {
  const PrayerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ContainerImageBackground(height: 220),
        c(height: 220),
        Center(
          child: Column(
            spacing: 5,
            children: [
              Text(
                "مواقيت الصلاه",
                style: AppTextStyles.zekerTitle.copyWith(fontSize: 24),
              ),
              Text(" باقي علي العصر", style: AppTextStyles.textOrange18),
              Text("10:20:00", style: AppTextStyles.zekerTitle),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          PrayerDate.getGregorianDate(
                            lanCode: context.l10n.localeName,
                          ),
                          style: AppTextStyles.zekerTextBold17wihte.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          PrayerDate.getHijriDate(
                            lanCode: context.l10n.localeName,
                          ),
                          style: AppTextStyles.zekerTextBold17wihte.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.orange,
                      size: 15,
                    ),
                    LocationNameBlocBuilder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
