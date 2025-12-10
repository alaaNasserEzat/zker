import 'package:equatable/equatable.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';

abstract class AddSphaState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// الحالة الابتدائية
class AddSphaInitial extends AddSphaState {}

/// أثناء الإضافة
class AddSphaLoading extends AddSphaState {}

/// بعد نجاح الإضافة
class AddSphaSuccess extends AddSphaState {
  final SphaEntity spha;

  AddSphaSuccess(this.spha);

  @override
  List<Object?> get props => [spha];
}

/// عند حدوث خطأ أثناء الإضافة
class AddSphaError extends AddSphaState {
  final ErrorModel error;

  AddSphaError(this.error);

  @override
  List<Object?> get props => [error];
}
