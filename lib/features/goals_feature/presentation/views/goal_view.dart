import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/core/widgets/snack_bar.dart';
import 'package:zker/features/goals_feature/presentation/cubits/goals_cubit.dart';
import 'package:zker/features/goals_feature/presentation/cubits/goals_state.dart';
import 'package:zker/features/goals_feature/presentation/views/goal_form_screen.dart';
import 'package:zker/features/goals_feature/presentation/views/goal_screen.dart';
import 'package:zker/features/goals_feature/presentation/views/goals_summary.dart';
import 'package:zker/features/goals_feature/presentation/views/widgets/goal_card.dart';
import 'package:zker/features/goals_feature/presentation/views/widgets/goal_details_screen.dart';

class GoalsView extends StatelessWidget {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "my goals"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<GoalsCubit>(),
                child: GoalFormScreen(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<GoalsCubit, GoalsState>(
        listener: (context, state) {
          if (state is GoalsFailure) {
            showSankBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is GoalsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GoalsFailure) {
            return ErrorView(
              message: state.message,
              onRetry: () {
                context.read<GoalsCubit>().loadGoals();
              },
            );
          }

          if (state is GoalsEmpty) {
            return const EmptyGoalsView();
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
                          showDeleteDialog(context, goal);
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
}
