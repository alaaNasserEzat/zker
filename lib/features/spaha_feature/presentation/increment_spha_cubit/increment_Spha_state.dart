import 'package:equatable/equatable.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';

abstract class IncrementSphaState  {


}

class IncrementSphaInitial extends IncrementSphaState {}

class IncrementSphaLoading extends IncrementSphaState {}

class IncrementSphaSuccess extends IncrementSphaState {
  final SphaEntity sphaEntity;

  IncrementSphaSuccess(this.sphaEntity);
}

class IncrementSphaError extends IncrementSphaState {
  final ErrorModel error;

  IncrementSphaError(this.error);

  @override
  List<Object?> get props => [error];
}
