import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/failure.dart';
import 'package:zker/features/notifications/domain/entities/notification_settings.dart';
import 'package:zker/features/notifications/domain/repositories/notification_repository.dart';

class GetNotificationSettings {
  GetNotificationSettings(this.repository);
  final NotificationRepository repository;
  Future<Either<Failure, NotificationSettings>> call() =>
      repository.getSettings();
}
