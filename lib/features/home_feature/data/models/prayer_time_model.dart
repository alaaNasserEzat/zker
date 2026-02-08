import 'package:adhan_dart/adhan_dart.dart';
import 'package:timezone/timezone.dart' as tz;

import 'package:zker/features/home_feature/domain/entitys/prayer_time_entity.dart';

class PrayerTimesModel extends PrayerTimesEntity {
  PrayerTimesModel({
    required super.fajr,
    required super.sunrise,
    required super.dhuhr,
    required super.asr,
    required super.maghrib,
    required super.isha,
    required super.currentPrayerName,
    required super.nextPrayerTime,
    required super.nextPrayerName,
  });

  factory PrayerTimesModel.fromAdhan({required PrayerTimes prayerTimes}) {
    final timezone = tz.getLocation('Africa/Cairo');

    return PrayerTimesModel(
      fajr: tz.TZDateTime.from(prayerTimes.fajr, timezone),
      sunrise: tz.TZDateTime.from(prayerTimes.sunrise, timezone),
      dhuhr: tz.TZDateTime.from(prayerTimes.dhuhr, timezone),
      asr: tz.TZDateTime.from(prayerTimes.asr, timezone),
      maghrib: tz.TZDateTime.from(prayerTimes.maghrib, timezone),
      isha: tz.TZDateTime.from(prayerTimes.isha, timezone),
      currentPrayerName: prayerTimes.currentPrayer(date: DateTime.now()),
      nextPrayerTime: tz.TZDateTime.from(prayerTimes.timeForPrayer(prayerTimes.nextPrayer()), timezone),
      nextPrayerName: prayerTimes.nextPrayer(),
    );
  }
}
