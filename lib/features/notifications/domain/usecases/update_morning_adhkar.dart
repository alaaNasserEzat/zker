import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:zker/core/errors/failure.dart';
import 'package:zker/features/notifications/domain/repositories/notification_repository.dart';

class UpdateMorningAdhkar {
  UpdateMorningAdhkar(this.repository);
  final NotificationRepository repository;
  Future<Either<Failure, void>> call({
    required bool enabled,
    required int timeMinutes,
  }) {
    debugPrint(
      '🔔 MORNING ENABLED: $enabled '
      'TIME: $timeMinutes',
    );
    return repository.updateMorningAdhkar(
      enabled: enabled,
      timeMinutes: timeMinutes,
    );
  }
}
