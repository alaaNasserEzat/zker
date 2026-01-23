import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/domain/repo/spha_repo.dart';

class IncrementUseCase {
  final SphaRepo sphaRepo;
  IncrementUseCase({required this.sphaRepo});

  Future<Either<ErrorModel, SphaEntity>> call({required SphaEntity spha}) => sphaRepo.increment(spha: spha);
}