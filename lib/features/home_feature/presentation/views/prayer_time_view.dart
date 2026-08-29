import 'package:flutter/material.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_bloc_builder.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_header.dart';

class PrayerTimeView extends StatelessWidget {
  const PrayerTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          spacing: 15,
          children: [PrayerHeader(), SizedBox(height: 10), PrayerBlocBuilder()],
        ),
      ),
    );
  }
}
