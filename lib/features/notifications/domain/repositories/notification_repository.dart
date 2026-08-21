import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/failure.dart';
import 'package:zker/features/notifications/domain/entities/notification_settings.dart';

abstract class NotificationRepository {
  Future<Either<Failure, NotificationSettings>> getSettings();
  Future<Either<Failure, void>> updateMorningAdhkar({
    required bool enabled,
    required int timeMinutes,
  });
  Future<Either<Failure, void>> updateEveningAdhkar({
    required bool enabled,
    required int timeMinutes,
  });
  Future<Either<Failure, void>> updateProphetReminder({
    required bool enabled,
    required int intervalMinutes,
  });
  Future<Either<Failure, void>> updateHourlyAdhkar({
    required bool enabled,
    required int intervalMinutes,
  });
  Future<Either<Failure, void>> cancelNotification({
    required int notificationId,
  });
}
