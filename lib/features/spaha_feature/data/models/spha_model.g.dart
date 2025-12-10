// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spha_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SphaModelAdapter extends TypeAdapter<SphaModel> {
  @override
  final typeId = 0;

  @override
  SphaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SphaModel(
      modelId: (fields[0] as num).toInt(),
      modelName: fields[1] as String,
      modelCurrentcount: (fields[2] as num).toInt(),
      modelCyclesCount: (fields[3] as num).toInt(),
      modelTotalCount: (fields[4] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, SphaModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.modelId)
      ..writeByte(1)
      ..write(obj.modelName)
      ..writeByte(2)
      ..write(obj.modelCurrentcount)
      ..writeByte(3)
      ..write(obj.modelCyclesCount)
      ..writeByte(4)
      ..write(obj.modelTotalCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SphaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
