import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/routs/go_route.dart';
import 'package:zker/features/azkar_feature/data/azkar_local_data_source/azkar_local_data_source.dart';
import 'package:zker/features/azkar_feature/data/repo_impl/azkar_repo_impl.dart';
import 'package:zker/features/azkar_feature/domain/repo/azkar_repo.dart';
import 'package:zker/features/azkar_feature/domain/usecases/get_azkar_category_use_case.dart';

class LocalNotificationService {
  LocalNotificationService({FlutterLocalNotificationsPlugin? plugin})
    : plugin = plugin ?? FlutterLocalNotificationsPlugin();

  static const morningId = 1001;
  static const eveningId = 1002;
  static const prophetId = 1003;
  static const hourlyId = 1004;

  final FlutterLocalNotificationsPlugin plugin;
  bool _initialized = false;

  Future<String?> getInitialPayload() async {
    final NotificationAppLaunchDetails? details = await plugin
        .getNotificationAppLaunchDetails();
    if (details?.didNotificationLaunchApp ?? false) {
      return details?.notificationResponse?.payload;
    }
    return null;
  }

  Future<void> handelNotificationTap(String? payload) async {
    if (payload == null) return;
    final AzkarLocalDataSource azkarLocalDataSource = AzkarLocalDataSourceImp();
    final AzkarRepo azkarRepo = AzkarRepoImpl(azkarLocalDataSource);
    final useCase = GetAzkarCategoryUseCase(azkarRepo);
    final allAzkar = await useCase();

    allAzkar.fold((failure) => print(failure), (categories) {
      final category = categories.firstWhere(
        (element) => element.category == payload,
      );
      appRouter.push(AppRoutes.azkarDetails, extra: category);
    });
  }

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
      final initialized = await plugin.initialize(
        settings,
        onDidReceiveNotificationResponse: (respose) {
          handelNotificationTap(respose.payload);
        },
      );
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
    String? payload,
  }) async {
    final scheduledDate = _nextTime(minutes);

    try {
      await plugin.zonedSchedule(
        id,
        title,
        body,
        scheduledDate,
        _details,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: payload,
      );

      debugPrint('✅ NOTIFICATION SCHEDULED SUCCESSFULLY');
      debugPrint('════════════════════════════════');
    } catch (e, stackTrace) {
      debugPrint('❌ SCHEDULE FAILED: $e');
      debugPrint('$stackTrace');
    }
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

    final hour = minutes ~/ 60;
    final minute = minutes % 60;

    var result = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (!result.isAfter(now)) {
      result = result.add(const Duration(days: 1));
    }

    debugPrint('🧮 _nextTime($minutes)');
    debugPrint('   Hour: $hour');
    debugPrint('   Minute: $minute');
    debugPrint('   Result: $result');

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
