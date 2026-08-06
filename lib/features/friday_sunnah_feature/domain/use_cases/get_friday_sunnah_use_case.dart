import 'package:dartz/dartz.dart';
import 'package:zker/features/friday_sunnah_feature/domain/entites/friday_sunnah_entity.dart';
import 'package:zker/features/friday_sunnah_feature/domain/failure.dart';
import 'package:zker/features/friday_sunnah_feature/domain/repo/friday_sunnah_repository.dart';

class GetFridaySunnahUseCase {
  final FridaySunnahRepository repository;

  GetFridaySunnahUseCase({required this.repository});

  Future<Either<Failure, List<FridaySunnahEntity>>> call() async {
    return repository.getFridaySunnah();
  }
}
