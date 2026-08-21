import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/failure.dart';
import 'package:zker/features/notifications/domain/repositories/notification_repository.dart';

class UpdateProphetReminder {
  UpdateProphetReminder(this.repository);
  final NotificationRepository repository;
  Future<Either<Failure, void>> call({
    required bool enabled,
    required int intervalMinutes,
  }) => repository.updateProphetReminder(
    enabled: enabled,
    intervalMinutes: intervalMinutes,
  );
}
