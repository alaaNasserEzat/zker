import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:zker/core/constent/extensions/localelization_extention.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/widgets/custom_shadow_contanier.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';
import 'package:zker/features/goals_feature/presentation/cubits/goals_cubit.dart';
import 'package:zker/features/goals_feature/presentation/views/goal_view.dart';

class GoalWidget extends StatefulWidget {
  const GoalWidget({super.key, required this.goals});

  final List<GoalEntity> goals;

  @override
  State<GoalWidget> createState() => _GoalWidgetState();
}

class _GoalWidgetState extends State<GoalWidget> {
  @override
  Widget build(BuildContext context) {
    final completedGoals = widget.goals
        .where((goal) => goal.isCompleted)
        .length;

    final totalGoals = widget.goals.length;

    final percentage = totalGoals == 0 ? 0.0 : completedGoals / totalGoals;

    return InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<GoalsCubit>(),
              child: GoalsView(),
            ),
          ),
        );

        if (mounted) {
          setState(() {});
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8),
        child: CustomShadowContanier(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      context.l10n.todayGoals,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),

                    const Spacer(),

                    ElevatedButton(
                      onPressed: () {
                        // context.push(AppRoutes.goalsView);
                      },
                      child: Text('${(percentage * 100).round()}%'),
                    ),
                  ],
                ),

                Text(
                  context.l10n.continueGoals,
                  style: Theme.of(context).textTheme.bodySmall,
                ),

                Text(
                  context.l10n.completedGoalsCount(completedGoals, totalGoals),
                ),

                LinearPercentIndicator(
                  percent: percentage,
                  backgroundColor: AppColors.cardDark,
                  progressColor: AppColors.green,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<GoalsCubit>(),
                            child: GoalsView(),
                          ),
                        ),
                      );

                      if (mounted) {
                        setState(() {});
                      }
                    },
                    child: Text(context.l10n.goToChecklist),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
