import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/spaha_feature/data/spha_repo_impl.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/domain/repo/spha_repo.dart';

class GetSphaUseCase {
  final SphaRepo sphaRepo;

  GetSphaUseCase( {required this.sphaRepo});

  Either<ErrorModel,List<SphaEntity>> call() => sphaRepo.getSpha();

}