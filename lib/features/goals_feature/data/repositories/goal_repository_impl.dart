import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/failure.dart';
import 'package:zker/features/goals_feature/data/datasources/goal_local_data_source.dart';
import 'package:zker/features/goals_feature/data/models/goal_model.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';
import 'package:zker/features/goals_feature/domain/repositories/goal_repository.dart';

class GoalRepositoryImpl implements GoalRepository {
  GoalRepositoryImpl({required this.localDataSource});

  final GoalLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<GoalEntity>>> getGoals() async {
    try {
      final models = await localDataSource.getGoals();
      return right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GoalEntity>> addGoal(GoalEntity goal) async {
    try {
      final goalmodel = GoalModel.fromEntity(goal);
      final model = await localDataSource.addGoal(goalmodel);
      return right(model.toEntity());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GoalEntity>> updateGoal(GoalEntity goal) async {
    try {
      final goalmodel = GoalModel.fromEntity(goal);
      final model = await localDataSource.updateGoal(goalmodel);
      return right(model.toEntity());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteGoal(String id) async {
    try {
      await localDataSource.deleteGoal(id);
      return right(unit);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GoalEntity>> updateGoalProgress({
    required String id,
    required int currentValue,
  }) async {
    try {
      final model = await localDataSource.updateGoalProgress(
        id: id,
        currentValue: currentValue,
      );
      return right(model.toEntity());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GoalEntity>>> resetExpiredGoals() async {
    try {
      final models = await localDataSource.resetExpiredGoals();
      return right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
