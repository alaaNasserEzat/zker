import 'package:zker/features/friday_sunnah_feature/domain/entites/friday_sunnah_entity.dart';

class FridaySunnahModel extends FridaySunnahEntity {
  const FridaySunnahModel({required super.name, required super.description});

  factory FridaySunnahModel.fromJson(Map<String, dynamic> json) {
    return FridaySunnahModel(
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
    );
  }
}
