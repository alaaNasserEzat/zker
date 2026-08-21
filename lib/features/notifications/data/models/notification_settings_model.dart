import 'package:zker/features/notifications/domain/entities/notification_settings.dart';

class NotificationSettingsModel extends NotificationSettings {
  const NotificationSettingsModel({
    required super.morningAdhkarEnabled,
    required super.morningAdhkarTimeMinutes,
    required super.eveningAdhkarEnabled,
    required super.eveningAdhkarTimeMinutes,
    required super.prophetReminderEnabled,
    required super.prophetReminderIntervalMinutes,
    required super.hourlyAdhkarEnabled,
    required super.hourlyAdhkarIntervalMinutes,
  });

  factory NotificationSettingsModel.fromMap(Map<dynamic, dynamic> map) {
    final defaults = NotificationSettings.defaults();
    return NotificationSettingsModel(
      morningAdhkarEnabled:
          map['morningAdhkarEnabled'] as bool? ?? defaults.morningAdhkarEnabled,
      morningAdhkarTimeMinutes:
          map['morningAdhkarTimeMinutes'] as int? ??
          defaults.morningAdhkarTimeMinutes,
      eveningAdhkarEnabled:
          map['eveningAdhkarEnabled'] as bool? ?? defaults.eveningAdhkarEnabled,
      eveningAdhkarTimeMinutes:
          map['eveningAdhkarTimeMinutes'] as int? ??
          defaults.eveningAdhkarTimeMinutes,
      prophetReminderEnabled:
          map['prophetReminderEnabled'] as bool? ??
          defaults.prophetReminderEnabled,
      prophetReminderIntervalMinutes:
          map['prophetReminderIntervalMinutes'] as int? ??
          defaults.prophetReminderIntervalMinutes,
      hourlyAdhkarEnabled:
          map['hourlyAdhkarEnabled'] as bool? ?? defaults.hourlyAdhkarEnabled,
      hourlyAdhkarIntervalMinutes:
          map['hourlyAdhkarIntervalMinutes'] as int? ??
          defaults.hourlyAdhkarIntervalMinutes,
    );
  }

  Map<String, dynamic> toMap() => {
    'morningAdhkarEnabled': morningAdhkarEnabled,
    'morningAdhkarTimeMinutes': morningAdhkarTimeMinutes,
    'eveningAdhkarEnabled': eveningAdhkarEnabled,
    'eveningAdhkarTimeMinutes': eveningAdhkarTimeMinutes,
    'prophetReminderEnabled': prophetReminderEnabled,
    'prophetReminderIntervalMinutes': prophetReminderIntervalMinutes,
    'hourlyAdhkarEnabled': hourlyAdhkarEnabled,
    'hourlyAdhkarIntervalMinutes': hourlyAdhkarIntervalMinutes,
  };
}
