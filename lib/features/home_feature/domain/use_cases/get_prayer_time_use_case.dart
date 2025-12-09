import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/home_feature/domain/entitys/prayer_time_entity.dart';
import 'package:zker/features/home_feature/domain/repo/home_repo.dart';

class GetPrayerTimeUseCase {
  final HomeRepo homeRepo;
  GetPrayerTimeUseCase(this.homeRepo);

  Future<Either<ErrorModel, PrayerTimesEntity>> call(){
    return homeRepo.getPrayerTime();
  }
}