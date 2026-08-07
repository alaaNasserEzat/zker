import 'package:hive_ce/hive.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_enums.dart';

part 'goal_model.g.dart';

@HiveType(typeId: 3)
class GoalModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final GoalType type;

  @HiveField(4)
  final int targetValue;

  @HiveField(5)
  final int currentValue;

  @HiveField(6)
  final GoalRecurrence recurrence;

  @HiveField(7)
  final bool isCompleted;

  @HiveField(8)
  final DateTime createdAt;

  @HiveField(9)
  final DateTime lastResetAt;

  GoalModel({
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

  factory GoalModel.fromEntity(GoalEntity entity) {
    return GoalModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      type: entity.type,
      targetValue: entity.targetValue,
      currentValue: entity.currentValue,
      recurrence: entity.recurrence,
      isCompleted: entity.isCompleted,
      createdAt: entity.createdAt,
      lastResetAt: entity.lastResetAt,
    );
  }

  GoalModel copyWith({
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
    return GoalModel(
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

  GoalEntity toEntity() => GoalEntity(
    id: id,
    title: title,
    description: description,
    type: type,
    targetValue: targetValue,
    currentValue: currentValue,
    recurrence: recurrence,
    isCompleted: isCompleted,
    createdAt: createdAt,
    lastResetAt: lastResetAt,
  );
}
