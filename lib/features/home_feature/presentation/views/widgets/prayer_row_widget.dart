import 'dart:async';

import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_image.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_cubit.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_state.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_time_item.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/sketonaizer_prayer_time.dart';

class PrayerRowWidget extends StatefulWidget {
  PrayerRowWidget({super.key});

  @override
  State<PrayerRowWidget> createState() => _PrayerRowWidgetState();
}

class _PrayerRowWidgetState extends State<PrayerRowWidget> {
   Timer? _timer;
   Duration remaining = Duration.zero;
   
  void startCountdown(DateTime nextPrayerTime) {
    _timer?.cancel();

    setState(() {
      remaining = nextPrayerTime.difference(DateTime.now());
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final diff = nextPrayerTime.difference(DateTime.now());
      if (diff.isNegative) {
        _timer?.cancel();
      } else {
        setState(() {
          remaining = diff;
        });
      }
    });
  }
    @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String formatDuration(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(d.inHours)}:${two(d.inMinutes.remainder(60))}:${two(d.inSeconds.remainder(60))}";
  }

  final List<PrayerModel> prayerList = [
    PrayerModel(name: "الفجر", icon: AppImage.moon),// "assets/images/cloudy.png"),
    PrayerModel(name: "الشروق", icon:AppImage.shrook),// "assets/images/clear-sky.png"),
    PrayerModel(name: "الظهر", icon:AppImage.sun),// "assets/images/sun.png"),
    PrayerModel(name: "العصر", icon:AppImage.cloudSun),// "assets/images/cloudy (1).png"),
    PrayerModel(name: "المغرب", icon:AppImage.sunFog),// "assets/images/cloud.png"),
    PrayerModel(name: "العشاء", icon: AppImage.helal),//"assets/images/moon.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state is PrayerTimeLoading) {
          return const Center(child: SizedBox(
            height: 110,
            child: SketonaizerPrayerTime()));
        }
        if (state is PrayerTimeError) {
          return Center(child: Text(state.errorModel.message));
        }
        if (state is PrayerTimeLoaded) {
          final t = state.prayerTimesEntity;
    print(t.nextPrayerName);
           WidgetsBinding.instance.addPostFrameCallback((_) {
    if (_timer == null) {
      startCountdown(t.nextPrayerTime);
    }
  });
          /// نربط الوقت الصحيح بكل صلاة
          final List<String> times = [
            DateFormat.jm().format(t.fajr),
            formatTime(t.sunrise),
            formatTime(t.dhuhr),
            formatTime(t.asr),
            formatTime(t.maghrib),
            formatTime(t.isha),
          ];
    
          return Column(
            children: [
              SizedBox(height: 30,),
                        Text(
          "باقي علي صلاه  ${getNextPrayername(t.nextPrayerName)}",
          style: AppTextStyles.zekerTextBold17wihte,
        ),
        Text(formatDuration(  remaining), style: AppTextStyles.zekerTitle),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(thickness: .5, color: AppColors.white),
        ),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: prayerList.length,
                  itemBuilder: (context, index) {
                    final prayer = prayerList[index];
                    final time = times[index];
                
                    return PrayerTimeItem(
                      text: prayer.name,
                      time: time,
                      img: prayer.icon,
                      iscurrentPrayer: getNextPrayername(t.nextPrayerName)==prayer.name,
                    );
                  },
                ),
              ),
            ],
          );
        }
    
        return const Center(child: Text("حدث خطأ في تحميل المواقيت"));
      },
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
getNextPrayername(Prayer p){
  switch(p){
    case Prayer.fajr:
      return "الفجر";
    case Prayer.sunrise:
      return "الشروق";
    case Prayer.dhuhr:
      return "الظهر";
    case Prayer.asr:
      return "العصر";
    case Prayer.maghrib:
      return "المغرب";
    case Prayer.isha:
      return "العشاء";
    default:
      return "";
  }

}

