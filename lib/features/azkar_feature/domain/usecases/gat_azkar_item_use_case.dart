import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_item_entity.dart';
import 'package:zker/features/azkar_feature/domain/repo/azkar_repo.dart';

class GatAzkarItemUseCase {
  final AzkarRepo azkarRepo;

  GatAzkarItemUseCase(this.azkarRepo);

  Future<Either<ErrorModel,List<AzkarItemEntity>>> call() => azkarRepo.getAzkarItems();
}