import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/services/service_locator.dart';

import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';
import 'package:zker/features/goals_feature/presentation/cubits/goals_cubit.dart';
import 'package:zker/features/goals_feature/presentation/cubits/goals_state.dart';
import 'package:zker/features/goals_feature/presentation/views/goal_form_screen.dart';
import 'package:zker/features/goals_feature/presentation/views/goals_summary.dart';
import 'package:zker/features/goals_feature/presentation/views/widgets/goal_card.dart';
import 'package:zker/features/goals_feature/presentation/views/widgets/goal_details_screen.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GoalsCubit>()..loadGoals(),
      child: const _GoalsView(),
    );
  }
}

class _GoalsView extends StatelessWidget {
  const _GoalsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Goals'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const GoalFormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<GoalsCubit, GoalsState>(
        listener: (context, state) {
          if (state is GoalsFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is GoalsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GoalsFailure) {
            return _ErrorView(
              message: state.message,
              onRetry: () {
                context.read<GoalsCubit>().loadGoals();
              },
            );
          }

          if (state is GoalsEmpty) {
            return const _EmptyGoalsView();
          }

          if (state is GoalsLoaded) {
            final goals = state.goals;

            return RefreshIndicator(
              onRefresh: () async {
                await context.read<GoalsCubit>().loadGoals();
              },
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  GoalsSummary(goals: goals),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      const Text(
                        'Your Goals',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${goals.length}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  ...goals.map(
                    (goal) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GoalCard(
                        goal: goal,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: context.read<GoalsCubit>(),
                                child: GoalDetailsScreen(goal: goal),
                              ),
                            ),
                          );
                        },
                        onEdit: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: context.read<GoalsCubit>(),
                                child: GoalFormScreen(goal: goal),
                              ),
                            ),
                          );
                        },
                        onDelete: () {
                          _showDeleteDialog(context, goal);
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, GoalEntity goal) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Delete Goal'),
          content: Text('Are you sure you want to delete "${goal.title}"?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                context.read<GoalsCubit>().deleteGoal(goal.id);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

class _EmptyGoalsView extends StatelessWidget {
  const _EmptyGoalsView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flag_outlined, size: 80, color: Colors.grey.shade400),
            const SizedBox(height: 20),
            const Text(
              'No Goals Yet',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Create your first goal and start your journey.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 60),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}
