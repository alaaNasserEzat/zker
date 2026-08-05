import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:zker/l10n/app_localizations.dart';

class PrayerService {
  static getNextPrayername(Prayer p, BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (p) {
      case Prayer.fajr:
        return l10n.fajr;
      case Prayer.sunrise:
        return l10n.sunrise;
      case Prayer.dhuhr:
        return l10n.dhuhr;
      case Prayer.asr:
        return l10n.asr;
      case Prayer.maghrib:
        return l10n.maghrib;
      case Prayer.isha:
        return l10n.isha;
      case Prayer.fajrAfter:
        return l10n.fajr;
      default:
        return "";
    }
  }
}
