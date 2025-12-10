import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/spaha_feature/data/models/spha_model.dart';

import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';

abstract class SphaRepo {
  Either<ErrorModel,List<SphaEntity>> getSpha();
  Future<void> addSpha({required SphaEntity spha});
}