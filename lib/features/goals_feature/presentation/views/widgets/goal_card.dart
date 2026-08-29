import 'package:flutter/material.dart';
import 'package:zker/core/constent/extensions/localelization_extention.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/widgets/custom_shadow_contanier.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_enums.dart';
import 'package:zker/features/goals_feature/presentation/views/widgets/goal_circlavatar_icon.dart';

class GoalCard extends StatelessWidget {
  final GoalEntity goal;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const GoalCard({
    super.key,
    required this.goal,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final progress = goal.targetValue <= 0
        ? 0.0
        : (goal.currentValue / goal.targetValue).clamp(0.0, 1.0);

    final percentage = (progress * 100).round();

    return CustomShadowContanier(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // CircleAvatar(
                  //   backgroundColor: Theme.of(context).colorScheme.primary,
                  //   child: Icon(
                  //     getGoalIcon(goal.type),
                  //     color: Theme.of(context).colorScheme.onPrimary,
                  //   ),
                  // ),
                  GoalCirclavatarIcon(goal: goal),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          goal.title,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (goal.description.isNotEmpty)
                          Text(
                            goal.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                      ],
                    ),
                  ),

                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        onEdit();
                      } else if (value == 'delete') {
                        onDelete();
                      }
                    },
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text(context.l10n.edit),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text(context.l10n.delete),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Row(
              //   children: [
              //     LinearProgress(value: progress),

              //     const SizedBox(width: 12),

              //     Text(
              //       '$percentage%',
              //       style: const TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Text(
                    '${goal.currentValue} / ${goal.targetValue}',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),

                  const Spacer(),

                  _RecurrenceBadge(recurrence: goal.recurrence),
                ],
              ),

              if (goal.isCompleted) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.check_circle, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      context.l10n.completed,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

IconData getGoalIcon(GoalType type) {
  switch (type) {
    case GoalType.quran:
      return Icons.menu_book;
    case GoalType.azkar:
      return Icons.auto_awesome;
    case GoalType.tasbeeh:
      return Icons.radio_button_checked;
    case GoalType.prayer:
      return Icons.mosque;
    case GoalType.custom:
      return Icons.flag;
  }
}

class _RecurrenceBadge extends StatelessWidget {
  final GoalRecurrence recurrence;

  const _RecurrenceBadge({required this.recurrence});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.orange,
      ),
      child: Text(
        _getLabel(context, recurrence),
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  String _getLabel(BuildContext context, GoalRecurrence recurrence) {
    switch (recurrence) {
      case GoalRecurrence.daily:
        return context.l10n.daily;
      case GoalRecurrence.weekly:
        return context.l10n.weekly;
      case GoalRecurrence.monthly:
        return context.l10n.monthly;
      case GoalRecurrence.once:
        return context.l10n.once;
    }
  }
}
