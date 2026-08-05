import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/home_feature/domain/repo/home_repo.dart';

class GetLocationNameUseCase {
  final HomeRepo homeRepo;
  GetLocationNameUseCase(this.homeRepo);

  Future<Either<ErrorModel, String>> call({required String locale}) {
    return homeRepo.getLocationName(locale: locale);
  }
}
