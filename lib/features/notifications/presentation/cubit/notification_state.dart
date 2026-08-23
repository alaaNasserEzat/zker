import 'package:equatable/equatable.dart';
import 'package:zker/features/notifications/domain/entities/notification_settings.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationUpdating extends NotificationState {
  const NotificationUpdating(this.settings);
  final NotificationSettings settings;
  @override
  List<Object?> get props => [settings];
}

class UpdateMorningAdhkarState extends NotificationState {}

class NotificationLoaded extends NotificationState {
  const NotificationLoaded(this.settings);
  final NotificationSettings settings;
  @override
  List<Object?> get props => [settings];
}

class NotificationError extends NotificationState {
  const NotificationError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
