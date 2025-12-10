import 'package:zker/core/errors/error_model.dart';

class DeleteSphaState {}
class DeleteSphaInitial extends DeleteSphaState {}
class DeleteSphaSuccess extends DeleteSphaState {
  DeleteSphaSuccess();
}
class DeleteSphaError extends DeleteSphaState {
  final ErrorModel errorModel;

  DeleteSphaError(this.errorModel);
}
class DeleteSphaLoading extends DeleteSphaState {}