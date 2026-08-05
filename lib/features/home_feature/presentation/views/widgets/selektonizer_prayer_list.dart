import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zker/core/utils/app_image.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_card.dart';

class SelektonizerPrayerList extends StatelessWidget {
  const SelektonizerPrayerList({super.key});

  @override

  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: 380,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return PrayerCard(
              icon: AppImage.cloudSun,
              text: "fack name",
              time: "12:00 AM",
              isCur: false,
            );
          },
        ),
      ),
    );
  }
}
