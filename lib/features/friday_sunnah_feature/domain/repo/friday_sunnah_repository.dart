import 'package:dartz/dartz.dart';
import 'package:zker/features/friday_sunnah_feature/domain/entites/friday_sunnah_entity.dart';
import 'package:zker/features/friday_sunnah_feature/domain/failure.dart';

abstract class FridaySunnahRepository {
  Future<Either<Failure, List<FridaySunnahEntity>>> getFridaySunnah();
}
