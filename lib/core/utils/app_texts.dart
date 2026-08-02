import 'package:flutter/material.dart';
import 'package:zker/l10n/app_localizations.dart';

class AppTexts {
  static String appTitle(BuildContext context) =>
      AppLocalizations.of(context)!.appTitle;
  static String home(BuildContext context) => AppLocalizations.of(context)!.home;
  static String favorite(BuildContext context) =>
      AppLocalizations.of(context)!.favorites;
  static String cart(BuildContext context) =>
      AppLocalizations.of(context)!.prayerTimes;
  static String profile(BuildContext context) =>
      AppLocalizations.of(context)!.profile;
}
