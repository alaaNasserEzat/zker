import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class PrayerDate {
  static getGregorianDate({required String lanCode}) {
    final now = DateTime.now();
    final gregorian = DateFormat('EEEE, d MMMM yyy', lanCode).format(now);
    return gregorian;
  }

  static getHijriDate({required String lanCode}) {
    HijriCalendar.setLocal(lanCode);
    final hijri = HijriCalendar.now();
    final hijriDate = "${hijri.hDay} ${hijri.longMonthName} ${hijri.hYear}";
    return hijriDate;
  }
}
