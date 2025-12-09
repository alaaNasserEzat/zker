import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/home_feature/domain/use_cases/get_prayer_time_use_case.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_state.dart';

class PrayerCubit extends Cubit<PrayerTimeState> {
  final GetPrayerTimeUseCase getPrayerTimeUseCase;

  PrayerCubit(this.getPrayerTimeUseCase) : super(PrayerTimeInitial());

  Future<void> loadPrayerTimes() async {
    emit(PrayerTimeLoading());

    final result = await getPrayerTimeUseCase.call();
    result.fold(
      (l) => emit(PrayerTimeError(errorModel:  l)),
      (r) => emit(PrayerTimeLoaded(prayerTimesEntity: r)),
    );
  }
}
