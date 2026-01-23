import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/domain/repo/spha_repo.dart';

class ZeroSphaUseCase {
  final SphaRepo sphaRepo;

  ZeroSphaUseCase({required this.sphaRepo});

  Future<Either<ErrorModel, void>> call({required SphaEntity spha}) => sphaRepo.zero(spha: spha);
}