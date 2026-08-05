import 'package:flutter/widgets.dart';
import 'package:zker/core/services/prayer_service.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/home_feature/domain/entitys/prayer_time_entity.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_count_down.dart';
import 'package:zker/l10n/app_localizations.dart';

class RemaininSection extends StatelessWidget {
  const RemaininSection({super.key, required this.prayerTimesEntity});
  final PrayerTimesEntity prayerTimesEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(
        //   AppLocalizations.of(context)!.appTitle,
        //   style: AppTextStyles.zekerTextBold17wihte,
        // ),
        Text(
          "${AppLocalizations.of(context)!.remainingUntilPrayer} ${PrayerService.getNextPrayername(prayerTimesEntity.nextPrayerName, context)}",
          style: AppTextStyles.textOrange18,
        ),
        //Text(formatDuration(remaining), style: AppTextStyles.zekerTitle),
        PrayerCountdown(nextPrayerTime: prayerTimesEntity.nextPrayerTime),
      ],
    );
  }
}
