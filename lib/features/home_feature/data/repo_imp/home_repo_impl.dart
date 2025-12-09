import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/core/errors/exptions.dart';
import 'package:zker/features/home_feature/data/data_source/home_data_source.dart';
import 'package:zker/features/home_feature/domain/entitys/prayer_time_entity.dart';
import 'package:zker/features/home_feature/domain/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo{
 final HomeDataSource homeDataSource;

  HomeRepoImpl({required this.homeDataSource});  
  @override
  Future<Either<ErrorModel, PrayerTimesEntity>> getPrayerTime() async{
try {
  final data=await homeDataSource.getPrayerTimes();
  return right(data);
} on CustomExpetion catch (e) {
 return left(handelexption(e));
}

  }
}