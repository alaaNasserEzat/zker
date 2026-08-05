import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zker/core/services/prayer_service.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_cubit.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_state.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_time_item.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/remainin_section.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/sketonaizer_prayer_time.dart';
import 'package:zker/l10n/app_localizations.dart';

class PrayerRowWidget extends StatefulWidget {
  const PrayerRowWidget({super.key});

  @override
  State<PrayerRowWidget> createState() => _PrayerRowWidgetState();
}

class _PrayerRowWidgetState extends State<PrayerRowWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state is PrayerTimeLoading) {
          return const Center(
            child: SizedBox(height: 110, child: SketonaizerPrayerTime()),
          );
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

          return Column(
            children: [
              SizedBox(height: 5),
              RemaininSection(prayerTimesEntity: t),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(thickness: .5, color: AppColors.white),
              ),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    final prayer = prayerList(context)[index];
                    final time = times[index];

                    return PrayerTimeItem(
                      text: prayer.name,
                      time: time,
                      img: prayer.icon,
                      iscurrentPrayer:
                          PrayerService.getNextPrayername(
                            t.nextPrayerName,
                            context,
                          ) ==
                          prayer.name,
                    );
                  },
                ),
              ),
            ],
          );
        }

        return Center(
          child: Text(AppLocalizations.of(context)!.prayerTimeLoadError),
        );
      },
    );
  }
}

class PrayerModel {
  final String name;
  final String icon;

  PrayerModel({required this.name, required this.icon});
}
