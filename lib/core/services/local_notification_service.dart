import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  LocalNotificationService({FlutterLocalNotificationsPlugin? plugin})
    : plugin = plugin ?? FlutterLocalNotificationsPlugin();

  static const morningId = 1001;
  static const eveningId = 1002;
  static const prophetId = 1003;
  static const hourlyId = 1004;

  final FlutterLocalNotificationsPlugin plugin;
  bool _initialized = false;

  Future<bool> initialize() async {
    if (_initialized) return true;
    try {
      const android = AndroidInitializationSettings('@mipmap/ic_launcher');
      const settings = InitializationSettings(
        android: android,
        iOS: DarwinInitializationSettings(),
        macOS: DarwinInitializationSettings(),
        linux: LinuxInitializationSettings(
          defaultActionName: 'Open notification',
        ),
      );
      final initialized = await plugin.initialize(settings);
      if (initialized != true) return false;
      _initialized = true;
      final androidPlugin = plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      await androidPlugin?.createNotificationChannel(
        const AndroidNotificationChannel(
          'adhkar_reminders',
          'Adhkar reminders',
          description: 'Reminders for daily and recurring adhkar',
          importance: Importance.high,
        ),
      );
      await androidPlugin?.requestNotificationsPermission();
      await plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      return true;
    } on Exception {
      return false;
    }
  }

  NotificationDetails get _details => const NotificationDetails(
    android: AndroidNotificationDetails(
      'adhkar_reminders',
      'Adhkar reminders',
      channelDescription: 'Reminders for daily and recurring adhkar',
      importance: Importance.high,
      priority: Priority.high,
    ),
    iOS: DarwinNotificationDetails(),
    macOS: DarwinNotificationDetails(),
  );

  Future<void> cancel(int id) => plugin.cancel(id);

  Future<void> scheduleDaily({
    required int id,
    required String title,
    required String body,
    required int minutes,
  }) async {
    await plugin.zonedSchedule(
      id,
      title,
      body,
      _nextTime(minutes),
      _details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> scheduleRecurring({
    required int id,
    required String title,
    required String body,
    required int intervalMinutes,
  }) {
    return plugin.periodicallyShowWithDuration(
      id,
      title,
      body,
      Duration(minutes: intervalMinutes),
      _details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  tz.TZDateTime _nextTime(int minutes) {
    final now = tz.TZDateTime.now(tz.local);
    var result = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      minutes ~/ 60,
      minutes % 60,
    );
    if (!result.isAfter(now)) result = result.add(const Duration(days: 1));
    return result;
  }

  Future<void> showTestNotification() async {
    await plugin.show(
      9999,
      'Test Notification',
      'Notification is working 🎉',
      _details,
    );
  }
}
