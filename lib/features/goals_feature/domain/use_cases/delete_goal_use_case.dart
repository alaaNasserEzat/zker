import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/failure.dart';
import 'package:zker/features/goals_feature/domain/repositories/goal_repository.dart';

class DeleteGoalUseCase {
  DeleteGoalUseCase(this.repository);

  final GoalRepository repository;

  Future<Either<Failure, Unit>> call(String id) async {
    return repository.deleteGoal(id);
  }
}
