// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteItemModelAdapter extends TypeAdapter<FavouriteItemModel> {
  @override
  final typeId = 1;

  @override
  FavouriteItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteItemModel(
      id: (fields[0] as num).toInt(),
      text: fields[1] as String,
      categoryId: (fields[2] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteItemModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.categoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
