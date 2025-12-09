import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/home_feature/domain/entitys/prayer_time_entity.dart';
 
 abstract class HomeRepo {
  Future<Either<ErrorModel, PrayerTimesEntity>> getPrayerTime();
}