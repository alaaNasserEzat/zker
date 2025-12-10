
import 'package:equatable/equatable.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';

abstract class SphaState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SphaInitial extends SphaState {}

class SphaLoading extends SphaState {}

class SphaLoaded extends SphaState {
  final List<SphaEntity> sphas;

  SphaLoaded(this.sphas);

  @override
  List<Object?> get props => [sphas];
}

class SphaError extends SphaState {
  final ErrorModel error;

  SphaError(this.error);

  @override
  List<Object?> get props => [error];
}
