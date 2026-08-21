import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/failure.dart';
import 'package:zker/features/notifications/domain/repositories/notification_repository.dart';

class CancelNotification {
  CancelNotification(this.repository);
  final NotificationRepository repository;
  Future<Either<Failure, void>> call({required int notificationId}) =>
      repository.cancelNotification(notificationId: notificationId);
}
