import 'package:flutter/material.dart';
import 'package:zker/l10n/app_localizations.dart';

class PrayerTimeView extends StatelessWidget {
  const PrayerTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(AppLocalizations.of(context)!.prayerTime)),
    );
  }
}
