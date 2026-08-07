import 'package:hive_ce/hive.dart';
import 'package:zker/features/goals_feature/data/models/goal_model.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_enums.dart';

abstract class GoalLocalDataSource {
  Future<List<GoalModel>> getGoals();
  Future<GoalModel> addGoal(GoalModel goal);
  Future<GoalModel> updateGoal(GoalModel goal);
  Future<void> deleteGoal(String id);
  Future<GoalModel> updateGoalProgress({
    required String id,
    required int currentValue,
  });
  Future<List<GoalModel>> resetExpiredGoals();
}

class GoalLocalDataSourceImpl implements GoalLocalDataSource {
  GoalLocalDataSourceImpl({required this.box});

  final Box<GoalModel> box;

  @override
  Future<List<GoalModel>> getGoals() async {
    final values = box.values.toList();
    return values;
  }

  @override
  Future<GoalModel> addGoal(GoalModel goal) async {
    await box.put(goal.id, goal);
    return goal;
  }

  @override
  Future<GoalModel> updateGoal(GoalModel goal) async {
    await box.put(goal.id, goal);
    return goal;
  }

  @override
  Future<void> deleteGoal(String id) async {
    await box.delete(id);
  }

  @override
  Future<GoalModel> updateGoalProgress({
    required String id,
    required int currentValue,
  }) async {
    final current = box.get(id);
    if (current == null) {
      throw Exception('Goal not found');
    }

    final updated = current.copyWith(
      currentValue: currentValue,
      isCompleted: currentValue >= current.targetValue,
    );

    await box.put(id, GoalModel.fromEntity(updated.toEntity()));
    return GoalModel.fromEntity(updated.toEntity());
  }

  @override
  Future<List<GoalModel>> resetExpiredGoals() async {
    final now = DateTime.now();
    final goals = box.values.toList();
    final updated = <GoalModel>[];

    for (final goal in goals) {
      bool shouldReset = false;
      switch (goal.recurrence) {
        case GoalRecurrence.daily:
          shouldReset = !isSameDay(goal.lastResetAt, now);
          break;
        case GoalRecurrence.weekly:
          shouldReset = !isSameWeek(goal.lastResetAt, now);
          break;
        case GoalRecurrence.monthly:
          shouldReset = !isSameMonth(goal.lastResetAt, now);
          break;
        case GoalRecurrence.once:
          shouldReset = false;
          break;
      }

      if (shouldReset) {
        final resetGoal = goal.copyWith(
          currentValue: 0,
          isCompleted: false,
          lastResetAt: now,
        );
        await box.put(goal.id, GoalModel.fromEntity(resetGoal.toEntity()));
        updated.add(GoalModel.fromEntity(resetGoal.toEntity()));
      } else {
        updated.add(goal);
      }
    }

    return updated;
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool isSameWeek(DateTime a, DateTime b) {
    final aWeek = a.weekday;
    final bWeek = b.weekday;
    return a.year == b.year && a.month == b.month && a.day == b.day ||
        (aWeek <= bWeek && a.difference(b).abs() < Duration(days: 7));
  }

  bool isSameMonth(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month;
  }
}
