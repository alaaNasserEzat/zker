
import 'package:zker/features/azkar_feature/domain/entites/azkar_item_entity.dart';

class AzkarCategoryEntity {
  final int id;
  final String category;
  final List<AzkarItemEntity> azkar;

  AzkarCategoryEntity({
    required this.id,
    required this.category,
    required this.azkar,
  });
}