import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zker/core/services/prayer_service.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_cubit.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_state.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_card.dart';

import 'package:zker/features/home_feature/presentation/views/widgets/prayer_row_widget.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/selektonizer_prayer_list.dart';
import 'package:zker/l10n/app_localizations.dart';

class PrayerBlocBuilder extends StatelessWidget {
  const PrayerBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state is PrayerTimeLoading) {
          return SelektonizerPrayerList();
        }
        if (state is PrayerTimeError) {
          return Center(child: Text(state.errorModel.message));
        }
        if (state is PrayerTimeLoaded) {
          final t = state.prayerTimesEntity;

          /// نربط الوقت الصحيح بكل صلاة
          final List<String> times = [
            DateFormat.jm().format(t.fajr),
            DateFormat.jm().format(t.sunrise),
            DateFormat.jm().format(t.dhuhr),
            DateFormat.jm().format(t.asr),
            DateFormat.jm().format(t.maghrib),
            DateFormat.jm().format(t.isha),
          ];

          return Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                PrayerModel prayer = prayerList(context)[index];
                final time = times[index];
                return PrayerCard(
                  icon: prayer.icon,
                  text: prayer.name,
                  time: time,
                  isCur:
                      prayer.name ==
                      PrayerService.getNextPrayername(
                        t.nextPrayerName,
                        context,
                      ),
                );
              },
            ),
          );
        }

        return Center(
          child: Text(AppLocalizations.of(context)!.prayerTimeLoadError),
        );
      },
    );
  }
}
