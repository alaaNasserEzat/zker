import 'package:hive_ce/hive.dart';
import 'package:zker/core/services/local_notification_service.dart';
import 'package:zker/features/notifications/data/models/notification_settings_model.dart';
import 'package:zker/features/notifications/domain/entities/notification_settings.dart';

abstract class NotificationLocalDataSource {
  Future<NotificationSettingsModel> getSettings();
  Future<void> updateMorning({required bool enabled, required int timeMinutes});
  Future<void> updateEvening({required bool enabled, required int timeMinutes});
  Future<void> updateProphet({
    required bool enabled,
    required int intervalMinutes,
  });
  Future<void> updateHourly({
    required bool enabled,
    required int intervalMinutes,
  });
  Future<void> cancel(int id);
  Future<void> initialize();
}

class NotificationLocalDataSourceImpl implements NotificationLocalDataSource {
  NotificationLocalDataSourceImpl({
    required this.box,
    required this.notificationService,
  });

  static const settingsKey = 'settings';
  final Box<dynamic> box;
  final LocalNotificationService notificationService;

  @override
  Future<void> initialize() async {
    await notificationService.initialize();
    final settings = await getSettings();
    if (settings.morningAdhkarEnabled) {
      await _scheduleMorning(settings.morningAdhkarTimeMinutes);
    }
    if (settings.eveningAdhkarEnabled) {
      await _scheduleEvening(settings.eveningAdhkarTimeMinutes);
    }
    if (settings.prophetReminderEnabled) {
      await _scheduleProphet(settings.prophetReminderIntervalMinutes);
    }
    if (settings.hourlyAdhkarEnabled) {
      await _scheduleHourly(settings.hourlyAdhkarIntervalMinutes);
    }
  }

  @override
  Future<NotificationSettingsModel> getSettings() async {
    final value = box.get(settingsKey);
    if (value is Map) return NotificationSettingsModel.fromMap(value);
    final defaults = NotificationSettings.defaults();
    return NotificationSettingsModel(
      morningAdhkarEnabled: defaults.morningAdhkarEnabled,
      morningAdhkarTimeMinutes: defaults.morningAdhkarTimeMinutes,
      eveningAdhkarEnabled: defaults.eveningAdhkarEnabled,
      eveningAdhkarTimeMinutes: defaults.eveningAdhkarTimeMinutes,
      prophetReminderEnabled: defaults.prophetReminderEnabled,
      prophetReminderIntervalMinutes: defaults.prophetReminderIntervalMinutes,
      hourlyAdhkarEnabled: defaults.hourlyAdhkarEnabled,
      hourlyAdhkarIntervalMinutes: defaults.hourlyAdhkarIntervalMinutes,
    );
  }

  Future<void> _save(NotificationSettingsModel settings) =>
      box.put(settingsKey, settings.toMap());

  @override
  Future<void> updateMorning({
    required bool enabled,
    required int timeMinutes,
  }) async {
    await notificationService.cancel(LocalNotificationService.morningId);
    if (enabled) await _scheduleMorning(timeMinutes);
    final current = await getSettings();
    await _save(
      NotificationSettingsModel(
        morningAdhkarEnabled: enabled,
        morningAdhkarTimeMinutes: timeMinutes,
        eveningAdhkarEnabled: current.eveningAdhkarEnabled,
        eveningAdhkarTimeMinutes: current.eveningAdhkarTimeMinutes,
        prophetReminderEnabled: current.prophetReminderEnabled,
        prophetReminderIntervalMinutes: current.prophetReminderIntervalMinutes,
        hourlyAdhkarEnabled: current.hourlyAdhkarEnabled,
        hourlyAdhkarIntervalMinutes: current.hourlyAdhkarIntervalMinutes,
      ),
    );
  }

  @override
  Future<void> updateEvening({
    required bool enabled,
    required int timeMinutes,
  }) async {
    await notificationService.cancel(LocalNotificationService.eveningId);
    if (enabled) await _scheduleEvening(timeMinutes);
    final current = await getSettings();
    await _save(
      NotificationSettingsModel(
        morningAdhkarEnabled: current.morningAdhkarEnabled,
        morningAdhkarTimeMinutes: current.morningAdhkarTimeMinutes,
        eveningAdhkarEnabled: enabled,
        eveningAdhkarTimeMinutes: timeMinutes,
        prophetReminderEnabled: current.prophetReminderEnabled,
        prophetReminderIntervalMinutes: current.prophetReminderIntervalMinutes,
        hourlyAdhkarEnabled: current.hourlyAdhkarEnabled,
        hourlyAdhkarIntervalMinutes: current.hourlyAdhkarIntervalMinutes,
      ),
    );
  }

  @override
  Future<void> updateProphet({
    required bool enabled,
    required int intervalMinutes,
  }) async {
    await notificationService.cancel(LocalNotificationService.prophetId);
    if (enabled) await _scheduleProphet(intervalMinutes);
    final current = await getSettings();
    await _save(
      NotificationSettingsModel(
        morningAdhkarEnabled: current.morningAdhkarEnabled,
        morningAdhkarTimeMinutes: current.morningAdhkarTimeMinutes,
        eveningAdhkarEnabled: current.eveningAdhkarEnabled,
        eveningAdhkarTimeMinutes: current.eveningAdhkarTimeMinutes,
        prophetReminderEnabled: enabled,
        prophetReminderIntervalMinutes: intervalMinutes,
        hourlyAdhkarEnabled: current.hourlyAdhkarEnabled,
        hourlyAdhkarIntervalMinutes: current.hourlyAdhkarIntervalMinutes,
      ),
    );
  }

  @override
  Future<void> updateHourly({
    required bool enabled,
    required int intervalMinutes,
  }) async {
    await notificationService.cancel(LocalNotificationService.hourlyId);
    if (enabled) await _scheduleHourly(intervalMinutes);
    final current = await getSettings();
    await _save(
      NotificationSettingsModel(
        morningAdhkarEnabled: current.morningAdhkarEnabled,
        morningAdhkarTimeMinutes: current.morningAdhkarTimeMinutes,
        eveningAdhkarEnabled: current.eveningAdhkarEnabled,
        eveningAdhkarTimeMinutes: current.eveningAdhkarTimeMinutes,
        prophetReminderEnabled: current.prophetReminderEnabled,
        prophetReminderIntervalMinutes: current.prophetReminderIntervalMinutes,
        hourlyAdhkarEnabled: enabled,
        hourlyAdhkarIntervalMinutes: intervalMinutes,
      ),
    );
  }

  Future<void> _scheduleMorning(int minutes) =>
      notificationService.scheduleDaily(
        id: LocalNotificationService.morningId,
        title: 'أذكار الصباح',
        body: 'حان وقت أذكار الصباح',
        minutes: minutes,
      );
  Future<void> _scheduleEvening(int minutes) =>
      notificationService.scheduleDaily(
        id: LocalNotificationService.eveningId,
        title: 'أذكار المساء',
        body: 'حان وقت أذكار المساء',
        minutes: minutes,
      );
  Future<void> _scheduleProphet(int minutes) =>
      notificationService.scheduleRecurring(
        id: LocalNotificationService.prophetId,
        title: 'الصلاة على النبي ﷺ',
        body: 'صلِّ على النبي ﷺ',
        intervalMinutes: minutes,
      );
  Future<void> _scheduleHourly(int minutes) =>
      notificationService.scheduleRecurring(
        id: LocalNotificationService.hourlyId,
        title: 'أذكار كل ساعة',
        body: 'حان وقت الذكر',
        intervalMinutes: minutes,
      );

  @override
  Future<void> cancel(int id) => notificationService.cancel(id);
}
