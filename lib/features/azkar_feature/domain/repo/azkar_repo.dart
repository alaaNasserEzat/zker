import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/azkar_feature/data/models/azkar_item_model.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_category_entity.dart';

abstract class AzkarRepo {
  Future<Either<ErrorModel, List<AzkarCategoryEntity>>> getAzkarCategories();
  Future<Either<ErrorModel, List<AzkarCategoryEntity>>> getCategoryDoaa();
}
