import 'package:zker/features/azkar_feature/data/models/azkar_item_model.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_category_entity.dart';

class AzkarCategoryModel extends AzkarCategoryEntity {
  final String? audio;
  final String? filename;

  AzkarCategoryModel({
    required super.id,
    required super.category,
    required super.azkar,
    required super.image,
    this.audio,
    this.filename,
  });

  factory AzkarCategoryModel.fromJson(Map<String, dynamic> json) {
    return AzkarCategoryModel(
      id: json['id'],
      image: json['image']??"🤲🏻",
      category: json['category'],
      azkar: (json['array'] as List? ?? [])
          .map((e) => AzkarItemModel.fromJson(e))
          .toList(),
      audio: json['audio'],
      filename: json['filename'],
    );
  }
}
