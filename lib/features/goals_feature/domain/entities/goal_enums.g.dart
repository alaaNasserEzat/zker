// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalTypeAdapter extends TypeAdapter<GoalType> {
  @override
  final typeId = 4;

  @override
  GoalType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GoalType.quran;
      case 1:
        return GoalType.azkar;
      case 2:
        return GoalType.tasbeeh;
      case 3:
        return GoalType.prayer;
      case 4:
        return GoalType.custom;
      default:
        return GoalType.quran;
    }
  }

  @override
  void write(BinaryWriter writer, GoalType obj) {
    switch (obj) {
      case GoalType.quran:
        writer.writeByte(0);
      case GoalType.azkar:
        writer.writeByte(1);
      case GoalType.tasbeeh:
        writer.writeByte(2);
      case GoalType.prayer:
        writer.writeByte(3);
      case GoalType.custom:
        writer.writeByte(4);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GoalRecurrenceAdapter extends TypeAdapter<GoalRecurrence> {
  @override
  final typeId = 5;

  @override
  GoalRecurrence read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GoalRecurrence.daily;
      case 1:
        return GoalRecurrence.weekly;
      case 2:
        return GoalRecurrence.monthly;
      case 3:
        return GoalRecurrence.once;
      default:
        return GoalRecurrence.daily;
    }
  }

  @override
  void write(BinaryWriter writer, GoalRecurrence obj) {
    switch (obj) {
      case GoalRecurrence.daily:
        writer.writeByte(0);
      case GoalRecurrence.weekly:
        writer.writeByte(1);
      case GoalRecurrence.monthly:
        writer.writeByte(2);
      case GoalRecurrence.once:
        writer.writeByte(3);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalRecurrenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
