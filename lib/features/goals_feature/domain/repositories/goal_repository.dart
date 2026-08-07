import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/failure.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';

abstract class GoalRepository {
  Future<Either<Failure, List<GoalEntity>>> getGoals();
  Future<Either<Failure, GoalEntity>> addGoal(GoalEntity goal);
  Future<Either<Failure, GoalEntity>> updateGoal(GoalEntity goal);
  Future<Either<Failure, Unit>> deleteGoal(String id);
  Future<Either<Failure, GoalEntity>> updateGoalProgress({
    required String id,
    required int currentValue,
  });
  Future<Either<Failure, List<GoalEntity>>> resetExpiredGoals();
}
