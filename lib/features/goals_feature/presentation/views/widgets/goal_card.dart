import 'package:flutter/material.dart';
import 'package:zker/core/widgets/custom_shadow_contanier.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_enums.dart';

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
                  CircleAvatar(child: Icon(_getGoalIcon(goal.type))),

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
                    itemBuilder: (_) => const [
                      PopupMenuItem(value: 'edit', child: Text('Edit')),
                      PopupMenuItem(value: 'delete', child: Text('Delete')),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 8,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Text(
                    '$percentage%',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

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
                const Row(
                  children: [
                    Icon(Icons.check_circle, size: 18),
                    SizedBox(width: 6),
                    Text(
                      'Completed',
                      style: TextStyle(fontWeight: FontWeight.bold),
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

  IconData _getGoalIcon(GoalType type) {
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
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Text(
        _getLabel(recurrence),
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }

  String _getLabel(GoalRecurrence recurrence) {
    switch (recurrence) {
      case GoalRecurrence.daily:
        return 'Daily';
      case GoalRecurrence.weekly:
        return 'Weekly';
      case GoalRecurrence.monthly:
        return 'Monthly';
      case GoalRecurrence.once:
        return 'Once';
    }
  }
}
