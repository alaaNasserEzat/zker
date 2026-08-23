import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/utils/app_image.dart';
import 'package:zker/features/home_feature/domain/use_cases/get_prayer_time_use_case.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_state.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_row_widget.dart';
import 'package:zker/l10n/app_localizations.dart';

class PrayerCubit extends Cubit<PrayerTimeState> {
  final GetPrayerTimeUseCase getPrayerTimeUseCase;

  PrayerCubit(this.getPrayerTimeUseCase) : super(PrayerTimeInitial());

  Future<void> loadPrayerTimes() async {
    emit(PrayerTimeLoading());

    final result = await getPrayerTimeUseCase.call();
    result.fold(
      (l) => emit(PrayerTimeError(errorModel: l)),
      (r) => emit(PrayerTimeLoaded(prayerTimesEntity: r)),
    );
  }
}

List<PrayerModel> prayerList(BuildContext context) => [
  PrayerModel(
    name: AppLocalizations.of(context)!.fajr,
    icon: AppImage.moon,
  ), // "assets/images/cloudy.png"),
  PrayerModel(
    name: AppLocalizations.of(context)!.sunrise,
    icon: AppImage.shrook,
  ), // "assets/images/clear-sky.png"),
  PrayerModel(
    name: AppLocalizations.of(context)!.dhuhr,
    icon: AppImage.sun,
  ), // "assets/images/sun.png"),
  PrayerModel(
    name: AppLocalizations.of(context)!.asr,
    icon: AppImage.cloudSun,
  ), // "assets/images/cloudy (1).png"),
  PrayerModel(
    name: AppLocalizations.of(context)!.maghrib,
    icon: AppImage.sunFog,
  ), // "assets/images/cloud.png"),
  PrayerModel(
    name: AppLocalizations.of(context)!.isha,
    icon: AppImage.helal,
  ), //"assets/images/moon.png"),
];
