import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/failure.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';
import 'package:zker/features/goals_feature/domain/repositories/goal_repository.dart';

class UpdateGoalUseCase {
  UpdateGoalUseCase(this.repository);

  final GoalRepository repository;

  Future<Either<Failure, GoalEntity>> call(GoalEntity goal) async {
    return repository.updateGoal(goal);
  }
}
