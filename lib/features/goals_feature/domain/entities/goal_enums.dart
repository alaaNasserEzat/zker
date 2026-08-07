import 'package:hive_ce/hive.dart';

part 'goal_enums.g.dart';

@HiveType(typeId: 4)
enum GoalType {
  @HiveField(0)
  quran,

  @HiveField(1)
  azkar,

  @HiveField(2)
  tasbeeh,

  @HiveField(3)
  prayer,

  @HiveField(4)
  custom,
}

@HiveType(typeId: 5)
enum GoalRecurrence {
  @HiveField(0)
  daily,

  @HiveField(1)
  weekly,

  @HiveField(2)
  monthly,

  @HiveField(3)
  once,
}
