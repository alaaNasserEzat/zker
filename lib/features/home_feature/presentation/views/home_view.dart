import 'package:flutter/material.dart';

import 'package:zker/core/utils/app_colors.dart';

import 'package:zker/features/home_feature/presentation/views/widgets/custom_row.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/home_category_row.dart';

import 'package:zker/features/home_feature/presentation/views/widgets/prayer_time_section.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/quran_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 10),
              //Text("ذِكْر", style: AppTextStyles.zekerTitle),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 350,

                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Image.asset(
                        "assets/images/m.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 350,
                      ),
                    ),
                  ),
                  Container(
                    height: 350,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      // AppColors.mainColor.withOpacity(.90),
                    ),
                  ),
                  PrayerTimeSection(),

                  Positioned(
                    bottom: -55,
                    right: 25,
                    left: 25,

                    child: QuranWidget(),
                  ),
                ],
              ),
              SizedBox(height: 60),
              CustomRow(),
              HomeCategoryRow(),

              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
