import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/notifications/domain/entities/notification_settings.dart';
import 'package:zker/features/notifications/domain/usecases/get_notification_settings.dart';
import 'package:zker/features/notifications/domain/usecases/update_evening_adhkar.dart';
import 'package:zker/features/notifications/domain/usecases/update_hourly_adhkar.dart';
import 'package:zker/features/notifications/domain/usecases/update_morning_adhkar.dart';
import 'package:zker/features/notifications/domain/usecases/update_prophet_reminder.dart';
import 'package:zker/features/notifications/presentation/cubit/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit({
    required this.getSettings,
    required this.updateMorning,
    required this.updateEvening,
    required this.updateProphet,
    required this.updateHourly,
  }) : super(NotificationInitial());
  final GetNotificationSettings getSettings;
  final UpdateMorningAdhkar updateMorning;
  final UpdateEveningAdhkar updateEvening;
  final UpdateProphetReminder updateProphet;
  final UpdateHourlyAdhkar updateHourly;

  Future<void> load() async {
    emit(NotificationLoading());
    final result = await getSettings();
    result.fold(
      (failure) => emit(NotificationError(failure.message)),
      (settings) => emit(NotificationLoaded(settings)),
    );
  }

  Future<void> toggleMorning(bool enabled) async {
    final settings = _settings;
    await _perform(
      updateMorning(
        enabled: enabled,
        timeMinutes: settings.morningAdhkarTimeMinutes,
      ),
      settings,
    );
  }

  Future<void> setMorningTime(int minutes) async {
    final settings = _settings;
    await _perform(
      updateMorning(
        enabled: settings.morningAdhkarEnabled,
        timeMinutes: minutes,
      ),
      settings,
    );
  }

  Future<void> toggleEvening(bool enabled) async {
    final settings = _settings;
    await _perform(
      updateEvening(
        enabled: enabled,
        timeMinutes: settings.eveningAdhkarTimeMinutes,
      ),
      settings,
    );
  }

  Future<void> setEveningTime(int minutes) async {
    final settings = _settings;
    await _perform(
      updateEvening(
        enabled: settings.eveningAdhkarEnabled,
        timeMinutes: minutes,
      ),
      settings,
    );
  }

  Future<void> toggleProphet(bool enabled) async {
    final settings = _settings;
    await _perform(
      updateProphet(
        enabled: enabled,
        intervalMinutes: settings.prophetReminderIntervalMinutes,
      ),
      settings,
    );
  }

  Future<void> setProphetInterval(int minutes) async {
    final settings = _settings;
    await _perform(
      updateProphet(
        enabled: settings.prophetReminderEnabled,
        intervalMinutes: minutes,
      ),
      settings,
    );
  }

  Future<void> toggleHourly(bool enabled) async {
    final settings = _settings;
    await _perform(
      updateHourly(
        enabled: enabled,
        intervalMinutes: settings.hourlyAdhkarIntervalMinutes,
      ),
      settings,
    );
  }

  Future<void> setHourlyInterval(int minutes) async {
    final settings = _settings;
    await _perform(
      updateHourly(
        enabled: settings.hourlyAdhkarEnabled,
        intervalMinutes: minutes,
      ),
      settings,
    );
  }

  NotificationSettings get _settings => state is NotificationLoaded
      ? (state as NotificationLoaded).settings
      : NotificationSettings.defaults();

  Future<void> _perform(
    Future<dynamic> operation,
    NotificationSettings previous,
  ) async {
    emit(NotificationUpdating(previous));
    final result = await operation;
    result.fold(
      (failure) => emit(NotificationError(failure.message)),
      (_) => load(),
    );
  }

  //morin
  updateMorningAdhkar({required bool enabled, required int timeMinutes}) async {
    final res = await updateMorning(enabled: enabled, timeMinutes: timeMinutes);

    res.fold(
      (ifLeft) {
        emit(NotificationError(ifLeft.message));
      },
      (no) {
        emit(UpdateMorningAdhkarState());
      },
    );
  }
}
