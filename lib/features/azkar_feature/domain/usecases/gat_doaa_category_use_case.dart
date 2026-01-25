import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_category_entity.dart';
import 'package:zker/features/azkar_feature/domain/repo/azkar_repo.dart';

class GatDoaaCategoryDoaaUseCase {
  final AzkarRepo azkarRepo;

  GatDoaaCategoryDoaaUseCase(this.azkarRepo);

  Future<Either<ErrorModel,List<AzkarCategoryEntity>>> call() => azkarRepo.getCategoryDoaa();
}