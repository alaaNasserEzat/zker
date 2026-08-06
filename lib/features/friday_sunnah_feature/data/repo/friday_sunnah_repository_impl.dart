import 'package:dartz/dartz.dart';
import 'package:zker/features/friday_sunnah_feature/data/data_sources/friday_sunnah_local_data_source.dart';
import 'package:zker/features/friday_sunnah_feature/domain/entites/friday_sunnah_entity.dart';
import 'package:zker/features/friday_sunnah_feature/domain/failure.dart';
import 'package:zker/features/friday_sunnah_feature/domain/repo/friday_sunnah_repository.dart';

class FridaySunnahRepositoryImpl implements FridaySunnahRepository {
  final FridaySunnahLocalDataSource localDataSource;

  FridaySunnahRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<FridaySunnahEntity>>> getFridaySunnah() async {
    try {
      final items = await localDataSource.getFridaySunnah();
      return Right(items);
    } on Exception catch (error) {
      return Left(Failure(error.toString()));
    }
  }
}
