import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_category_entity.dart';
import 'package:zker/features/azkar_feature/domain/repo/azkar_repo.dart';

class GetAzkarCategoryUseCase {
  final AzkarRepo azkarRepo;

  GetAzkarCategoryUseCase(this.azkarRepo);

  Future<Either<ErrorModel,List<AzkarCategoryEntity>>> call() => azkarRepo.getAzkarCategories();
}