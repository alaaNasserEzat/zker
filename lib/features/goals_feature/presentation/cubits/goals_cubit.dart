import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';
import 'package:zker/features/goals_feature/domain/use_cases/add_goal_use_case.dart';
import 'package:zker/features/goals_feature/domain/use_cases/delete_goal_use_case.dart';
import 'package:zker/features/goals_feature/domain/use_cases/get_goals_use_case.dart';
import 'package:zker/features/goals_feature/domain/use_cases/reset_expired_goals_use_case.dart';
import 'package:zker/features/goals_feature/domain/use_cases/update_goal_progress_use_case.dart';
import 'package:zker/features/goals_feature/domain/use_cases/update_goal_use_case.dart';
import 'package:zker/features/goals_feature/presentation/cubits/goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  GoalsCubit({
    required this.getGoalsUseCase,
    required this.addGoalUseCase,
    required this.updateGoalUseCase,
    required this.deleteGoalUseCase,
    required this.updateGoalProgressUseCase,
    required this.resetExpiredGoalsUseCase,
  }) : super(GoalsInitial());

  final GetGoalsUseCase getGoalsUseCase;
  final AddGoalUseCase addGoalUseCase;
  final UpdateGoalUseCase updateGoalUseCase;
  final DeleteGoalUseCase deleteGoalUseCase;
  final UpdateGoalProgressUseCase updateGoalProgressUseCase;
  final ResetExpiredGoalsUseCase resetExpiredGoalsUseCase;

  Future<void> loadGoals() async {
    emit(GoalsLoading());
    final resetResult = await resetExpiredGoalsUseCase();
    final goalsResult = await getGoalsUseCase();

    goalsResult.fold((failure) => emit(GoalsFailure(failure.message)), (goals) {
      if (goals.isEmpty) {
        emit(GoalsEmpty());
      } else {
        emit(GoalsLoaded(goals));
      }
    });

    resetResult.fold((_) {}, (_) {});
  }

  Future<void> addGoal(GoalEntity goal) async {
    emit(GoalsLoading());
    final result = await addGoalUseCase(goal);
    result.fold(
      (failure) => emit(GoalsFailure(failure.message)),
      (_) => loadGoals(),
    );
  }

  Future<void> updateGoal(GoalEntity goal) async {
    emit(GoalsLoading());
    final result = await updateGoalUseCase(goal);
    result.fold(
      (failure) => emit(GoalsFailure(failure.message)),
      (_) => loadGoals(),
    );
  }

  Future<void> deleteGoal(String id) async {
    emit(GoalsLoading());
    final result = await deleteGoalUseCase(id);
    result.fold(
      (failure) => emit(GoalsFailure(failure.message)),
      (_) => loadGoals(),
    );
  }

  Future<void> updateProgress({
    required String id,
    required int currentValue,
  }) async {
    emit(GoalsLoading());
    final result = await updateGoalProgressUseCase(
      id: id,
      currentValue: currentValue,
    );
    result.fold(
      (failure) => emit(GoalsFailure(failure.message)),
      (_) => loadGoals(),
    );
  }
}
