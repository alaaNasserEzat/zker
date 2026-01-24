import 'package:zker/features/azkar_feature/domain/entites/azkar_item_entity.dart';

class AzkarItemModel extends AzkarItemEntity {
  final String? audio;
  final String? filename;
  AzkarItemModel({
    required super.id,
    required super.text,
    required super.count,
    this.audio,
    this.filename,
  });

  factory AzkarItemModel.fromJson(Map<String, dynamic> json) {
    return AzkarItemModel(
      id: json['id'],
      text: json['text'],
      count: json['count'],
      audio: json['audio'],
      filename: json['filename'],
    );
  }
}
