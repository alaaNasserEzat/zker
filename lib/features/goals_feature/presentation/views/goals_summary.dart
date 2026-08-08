import 'package:flutter/material.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';

class GoalsSummary extends StatelessWidget {
  final List<GoalEntity> goals;

  const GoalsSummary({super.key, required this.goals});

  @override
  Widget build(BuildContext context) {
    final completedGoals = goals.where((goal) => goal.isCompleted).length;

    final totalGoals = goals.length;

    final percentage = totalGoals == 0 ? 0.0 : completedGoals / totalGoals;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Progress', style: Theme.of(context).textTheme.labelLarge),

          const SizedBox(height: 20),

          Row(
            children: [
              _SummaryItem(
                title: 'Completed',
                value: '$completedGoals',
                icon: Icons.check_circle_outline,
              ),
              _SummaryItem(
                title: 'Total',
                value: '$totalGoals',
                icon: Icons.flag_outlined,
              ),
              _SummaryItem(
                title: 'Progress',
                value: '${(percentage * 100).round()}%',
                icon: Icons.trending_up,
              ),
            ],
          ),

          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(value: percentage, minHeight: 10),
          ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _SummaryItem({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.onPrimary),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
