import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/features/goals_feature/presentation/cubits/goals_cubit.dart';
import 'package:zker/features/goals_feature/presentation/cubits/goals_state.dart';
import 'package:zker/features/goals_feature/presentation/views/goal_screen.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_row.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/goal_widget.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/home_category_row.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_time_section.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/quran_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GoalsCubit>()..loadGoals(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 75.0),
            child: Column(
              spacing: 5,
              children: [
                const SizedBox(height: 20),
                //Text("ذِكْر", style: AppTextStyles.zekerTitle),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // ContainerImageBackground(),
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
                CustomRow(text: "العبادات"),
                HomeCategoryRow(),
                CustomRow(text: "الاهداف"),
                BlocBuilder<GoalsCubit, GoalsState>(
                  builder: (context, state) {
                    if (state is GoalsLoaded) {
                      return GoalWidget(goals: state.goals);
                    }
                    return GoalWidget(goals: []);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
