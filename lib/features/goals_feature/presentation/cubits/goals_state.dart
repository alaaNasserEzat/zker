import 'package:equatable/equatable.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';

abstract class GoalsState extends Equatable {
  const GoalsState();

  @override
  List<Object?> get props => [];
}

class GoalsInitial extends GoalsState {}

class GoalsLoading extends GoalsState {}

class GoalsLoaded extends GoalsState {
  const GoalsLoaded(this.goals);

  final List<GoalEntity> goals;

  @override
  List<Object?> get props => [goals];
}

class GoalsEmpty extends GoalsState {}

class GoalsFailure extends GoalsState {
  const GoalsFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
