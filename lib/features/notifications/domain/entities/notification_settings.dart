class NotificationSettings {
  const NotificationSettings({
    required this.morningAdhkarEnabled,
    required this.morningAdhkarTimeMinutes,
    required this.eveningAdhkarEnabled,
    required this.eveningAdhkarTimeMinutes,
    required this.prophetReminderEnabled,
    required this.prophetReminderIntervalMinutes,
    required this.hourlyAdhkarEnabled,
    required this.hourlyAdhkarIntervalMinutes,
  });

  static const defaultMorningTimeMinutes = 5 * 60;
  static const defaultEveningTimeMinutes = 17 * 60;
  static const defaultProphetReminderIntervalMinutes = 15;
  static const defaultHourlyAdhkarIntervalMinutes = 60;

  final bool morningAdhkarEnabled;
  final int morningAdhkarTimeMinutes;
  final bool eveningAdhkarEnabled;
  final int eveningAdhkarTimeMinutes;
  final bool prophetReminderEnabled;
  final int prophetReminderIntervalMinutes;
  final bool hourlyAdhkarEnabled;
  final int hourlyAdhkarIntervalMinutes;

  factory NotificationSettings.defaults() => const NotificationSettings(
    morningAdhkarEnabled: false,
    morningAdhkarTimeMinutes: defaultMorningTimeMinutes,
    eveningAdhkarEnabled: false,
    eveningAdhkarTimeMinutes: defaultEveningTimeMinutes,
    prophetReminderEnabled: false,
    prophetReminderIntervalMinutes: defaultProphetReminderIntervalMinutes,
    hourlyAdhkarEnabled: false,
    hourlyAdhkarIntervalMinutes: defaultHourlyAdhkarIntervalMinutes,
  );
}
