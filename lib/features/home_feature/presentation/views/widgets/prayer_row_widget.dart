import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_cubit.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_state.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_time_item.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/sketonaizer_prayer_time.dart';

class PrayerRowWidget extends StatelessWidget {
  PrayerRowWidget({super.key});

  final List<PrayerModel> prayerList = [
    PrayerModel(name: "الفجر", icon: "assets/images/sun.png"),
    PrayerModel(name: "الشروق", icon: "assets/images/day.png"),
    PrayerModel(name: "الظهر", icon: "assets/images/summer.png"),
    PrayerModel(name: "العصر", icon: "assets/images/sun (2).png"),
    PrayerModel(name: "المغرب", icon: "assets/images/cloud.png"),
    PrayerModel(name: "العشاء", icon: "assets/images/moon.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: BlocBuilder<PrayerCubit, PrayerTimeState>(
        builder: (context, state) {
          if (state is PrayerTimeLoading) {
            return const Center(child: SketonaizerPrayerTime());
          }
          if (state is PrayerTimeError) {
            return Center(child: Text(state.errorModel.message));
          }
          if (state is PrayerTimeLoaded) {
            final t = state.prayerTimesEntity;

            /// نربط الوقت الصحيح بكل صلاة
            final List<String> times = [
              DateFormat.jm().format(t.fajr),
              formatTime(t.sunrise),
              formatTime(t.dhuhr),
              formatTime(t.asr),
              formatTime(t.maghrib),
              formatTime(t.isha),
            ];

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: prayerList.length,
              itemBuilder: (context, index) {
                final prayer = prayerList[index];
                final time = times[index];

                return PrayerTimeItem(
                  text: prayer.name,
                  time: time,
                  img: prayer.icon,
                );
              },
            );
          }

          return const Center(child: Text("حدث خطأ في تحميل المواقيت"));
        },
      ),
    );
  }
}

/// 🔥 فورمات الوقت (AM/PM)
String formatTime(DateTime time) {
  return "${time.hour % 12 == 0 ? 12 : time.hour % 12}:${time.minute.toString().padLeft(2, '0')} ${time.hour >= 12 ? 'PM' : 'AM'}";
}

class PrayerModel {
  final String name;
  final String icon;

  PrayerModel({required this.name, required this.icon});
}
