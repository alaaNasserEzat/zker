import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_enums.dart';
import 'package:zker/features/goals_feature/presentation/cubits/goals_cubit.dart';
import 'package:zker/features/goals_feature/presentation/cubits/goals_state.dart';
import 'package:zker/features/goals_feature/presentation/views/widgets/linear_progress.dart';

class GoalDetailsScreen extends StatelessWidget {
  final GoalEntity goal;

  const GoalDetailsScreen({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Goal Details')),
      body: BlocBuilder<GoalsCubit, GoalsState>(
        builder: (context, state) {
          final currentGoal = _findCurrentGoal(context, goal.id);

          final displayGoal = currentGoal ?? goal;

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _GoalHeader(goal: displayGoal),

              const SizedBox(height: 30),

              _ProgressSection(goal: displayGoal),

              const SizedBox(height: 30),

              const Text(
                'Update Progress',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              _ProgressControls(goal: displayGoal),

              const SizedBox(height: 30),

              _GoalInfo(goal: displayGoal),
            ],
          );
        },
      ),
    );
  }

  GoalEntity? _findCurrentGoal(BuildContext context, String id) {
    final state = context.read<GoalsCubit>().state;

    if (state is GoalsLoaded) {
      for (final item in state.goals) {
        if (item.id == id) {
          return item;
        }
      }
    }

    return null;
  }
}

class _GoalHeader extends StatelessWidget {
  final GoalEntity goal;

  const _GoalHeader({required this.goal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 42, child: Icon(_getIcon(goal.type), size: 40)),
        // GoalCirclavatarIcon(goal: goal, size: 35),
        const SizedBox(height: 16),

        Text(
          goal.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),

        if (goal.description.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            goal.description,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],

        const SizedBox(height: 12),

        if (goal.isCompleted)
          const Chip(
            avatar: Icon(Icons.check, size: 18),
            label: Text('Completed'),
          ),
      ],
    );
  }

  IconData _getIcon(GoalType type) {
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

class _ProgressSection extends StatelessWidget {
  final GoalEntity goal;

  const _ProgressSection({required this.goal});

  @override
  Widget build(BuildContext context) {
    final progress = goal.targetValue <= 0
        ? 0.0
        : (goal.currentValue / goal.targetValue).clamp(0.0, 1.0);

    return Column(
      children: [
        Text(
          '${(progress * 100).round()}%',
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgress(value: progress),
        ),

        const SizedBox(height: 12),

        Text(
          '${goal.currentValue} / ${goal.targetValue}',
          style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
        ),
      ],
    );
  }
}

class _ProgressControls extends StatefulWidget {
  final GoalEntity goal;

  const _ProgressControls({required this.goal});

  @override
  State<_ProgressControls> createState() => _ProgressControlsState();
}

class _ProgressControlsState extends State<_ProgressControls> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
      text: widget.goal.currentValue.toString(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<GoalsCubit>().state is GoalsLoading;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(
              onPressed: isLoading
                  ? null
                  : () {
                      final newValue = widget.goal.currentValue - 1;

                      _update(context, newValue < 0 ? 0 : newValue);
                    },
              icon: const Icon(Icons.remove),
            ),

            const SizedBox(width: 24),

            Text(
              '${widget.goal.currentValue}',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(width: 24),

            IconButton.filled(
              onPressed: isLoading
                  ? null
                  : () {
                      _update(context, widget.goal.currentValue + 1);
                    },
              icon: const Icon(Icons.add),
            ),
          ],
        ),

        const SizedBox(height: 24),

        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            labelText: 'Set current value',
            suffixIcon: IconButton(
              onPressed: isLoading
                  ? null
                  : () {
                      final value = int.tryParse(_controller.text);

                      if (value == null || value < 0) {
                        return;
                      }

                      _update(context, value);
                    },
              icon: const Icon(Icons.check),
            ),
          ),
        ),
      ],
    );
  }

  void _update(BuildContext context, int value) {
    _controller.text = value.toString();

    context.read<GoalsCubit>().updateProgress(
      id: widget.goal.id,
      currentValue: value,
    );
  }
}

class _GoalInfo extends StatelessWidget {
  final GoalEntity goal;

  const _GoalInfo({required this.goal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _InfoRow(
          icon: Icons.repeat,
          title: 'Recurrence',
          value: _recurrenceLabel(goal.recurrence),
        ),

        _InfoRow(
          icon: Icons.calendar_today,
          title: 'Created',
          value: _formatDate(goal.createdAt),
        ),

        _InfoRow(
          icon: Icons.refresh,
          title: 'Last Reset',
          value: _formatDate(goal.lastResetAt),
        ),
      ],
    );
  }

  String _recurrenceLabel(GoalRecurrence recurrence) {
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

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      trailing: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
