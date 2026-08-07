import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/failure.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';
import 'package:zker/features/goals_feature/domain/repositories/goal_repository.dart';

class ResetExpiredGoalsUseCase {
  ResetExpiredGoalsUseCase(this.repository);

  final GoalRepository repository;

  Future<Either<Failure, List<GoalEntity>>> call() async {
    return repository.resetExpiredGoals();
  }
}
