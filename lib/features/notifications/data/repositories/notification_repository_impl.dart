import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/failure.dart';
import 'package:zker/features/notifications/data/datasources/notification_local_data_source.dart';
import 'package:zker/features/notifications/domain/entities/notification_settings.dart';
import 'package:zker/features/notifications/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl({required this.localDataSource});

  final NotificationLocalDataSource localDataSource;

  @override
  Future<Either<Failure, NotificationSettings>> getSettings() async {
    try {
      return Right(await localDataSource.getSettings());
    } on Exception catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  Future<Either<Failure, void>> _update(Future<void> Function() action) async {
    try {
      await action();
      return const Right(null);
    } on Exception catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateMorningAdhkar({
    required bool enabled,
    required int timeMinutes,
  }) => _update(
    () => localDataSource.updateMorning(
      enabled: enabled,
      timeMinutes: timeMinutes,
    ),
  );

  @override
  Future<Either<Failure, void>> updateEveningAdhkar({
    required bool enabled,
    required int timeMinutes,
  }) => _update(
    () => localDataSource.updateEvening(
      enabled: enabled,
      timeMinutes: timeMinutes,
    ),
  );

  @override
  Future<Either<Failure, void>> updateProphetReminder({
    required bool enabled,
    required int intervalMinutes,
  }) => _update(
    () => localDataSource.updateProphet(
      enabled: enabled,
      intervalMinutes: intervalMinutes,
    ),
  );

  @override
  Future<Either<Failure, void>> updateHourlyAdhkar({
    required bool enabled,
    required int intervalMinutes,
  }) => _update(
    () => localDataSource.updateHourly(
      enabled: enabled,
      intervalMinutes: intervalMinutes,
    ),
  );

  @override
  Future<Either<Failure, void>> cancelNotification({
    required int notificationId,
  }) => _update(() => localDataSource.cancel(notificationId));
}
