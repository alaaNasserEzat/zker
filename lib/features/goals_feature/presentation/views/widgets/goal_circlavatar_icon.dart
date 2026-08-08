import 'package:flutter/material.dart';

import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';
import 'package:zker/features/goals_feature/presentation/views/widgets/goal_card.dart';

class GoalCirclavatarIcon extends StatelessWidget {
  const GoalCirclavatarIcon({super.key, required this.goal, this.size});
  final GoalEntity goal;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Icon(
        getGoalIcon(goal.type),

        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
