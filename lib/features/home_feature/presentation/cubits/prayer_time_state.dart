import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/home_feature/domain/entitys/prayer_time_entity.dart';

class PrayerTimeState {}
class PrayerTimeInitial extends PrayerTimeState {}
class PrayerTimeLoading extends PrayerTimeState {}
class PrayerTimeLoaded extends PrayerTimeState {
  final PrayerTimesEntity prayerTimesEntity;
  PrayerTimeLoaded({required this.prayerTimesEntity});
}
class PrayerTimeError extends PrayerTimeState {
  final ErrorModel errorModel;
  PrayerTimeError({required this.errorModel});
}