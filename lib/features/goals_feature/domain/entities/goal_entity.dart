import 'package:equatable/equatable.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_enums.dart';

// enum GoalType { quran, azkar, tasbeeh, prayer, custom }

// enum GoalRecurrence { daily, weekly, monthly, once }

class GoalEntity extends Equatable {
  const GoalEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.targetValue,
    required this.currentValue,
    required this.recurrence,
    required this.isCompleted,
    required this.createdAt,
    required this.lastResetAt,
  });

  final String id;
  final String title;
  final String description;
  final GoalType type;
  final int targetValue;
  final int currentValue;
  final GoalRecurrence recurrence;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime lastResetAt;

  GoalEntity copyWith({
    String? id,
    String? title,
    String? description,
    GoalType? type,
    int? targetValue,
    int? currentValue,
    GoalRecurrence? recurrence,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? lastResetAt,
  }) {
    return GoalEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      targetValue: targetValue ?? this.targetValue,
      currentValue: currentValue ?? this.currentValue,
      recurrence: recurrence ?? this.recurrence,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      lastResetAt: lastResetAt ?? this.lastResetAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    type,
    targetValue,
    currentValue,
    recurrence,
    isCompleted,
    createdAt,
    lastResetAt,
  ];
}
