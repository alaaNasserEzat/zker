class PrayerTimesEntity {
  final DateTime fajr;
  final DateTime dhuhr;
  final DateTime asr;
  final DateTime maghrib;
  final DateTime isha;
  final DateTime sunrise;
  final  currentPrayerName;
  final  nextPrayerTime;
  final nextPrayerName;

  PrayerTimesEntity({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.sunrise,
    required this.currentPrayerName,
    required this.nextPrayerTime, 
    required this.nextPrayerName
  });
}
