import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:zker/core/constent/extensions/duration_extention.dart';
import 'package:zker/core/utils/app_text_styles.dart';

class PrayerCountdown extends StatefulWidget {
  const PrayerCountdown({super.key, required this.nextPrayerTime});

  final DateTime nextPrayerTime;

  @override
  State<PrayerCountdown> createState() => _PrayerCountdownState();
}

class _PrayerCountdownState extends State<PrayerCountdown> {
  Timer? _timer;

  Duration remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  void didUpdateWidget(covariant PrayerCountdown oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.nextPrayerTime != widget.nextPrayerTime) {
      _start();
    }
  }

  void _start() {
    _timer?.cancel();

    remaining = widget.nextPrayerTime.difference(DateTime.now());

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final diff = widget.nextPrayerTime.difference(DateTime.now());

      if (diff.isNegative) {
        _timer?.cancel();
        return;
      }

      setState(() {
        remaining = diff;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(remaining.hhmmss, style: AppTextStyles.zekerTitle);
  }
}
