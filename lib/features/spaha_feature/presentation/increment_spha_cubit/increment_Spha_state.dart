
import 'package:zker/core/errors/error_model.dart';

abstract class IncrementSphaState  {


}

class IncrementSphaInitial extends IncrementSphaState {}

class IncrementSphaLoading extends IncrementSphaState {}

class IncrementSphaSuccess extends IncrementSphaState {


  IncrementSphaSuccess();
}

class IncrementSphaError extends IncrementSphaState {
  final ErrorModel error;

  IncrementSphaError(this.error);

  @override
  List<Object?> get props => [error];
}

class ZeroState extends IncrementSphaState {}