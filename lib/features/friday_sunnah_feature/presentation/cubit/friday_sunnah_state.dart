import 'package:equatable/equatable.dart';
import 'package:zker/features/friday_sunnah_feature/domain/entites/friday_sunnah_entity.dart';

abstract class FridaySunnahState extends Equatable {
  const FridaySunnahState();

  @override
  List<Object?> get props => [];
}

class FridaySunnahInitial extends FridaySunnahState {
  const FridaySunnahInitial();
}

class FridaySunnahLoading extends FridaySunnahState {
  const FridaySunnahLoading();
}

class FridaySunnahSuccess extends FridaySunnahState {
  final List<FridaySunnahEntity> items;

  const FridaySunnahSuccess(this.items);

  @override
  List<Object?> get props => [items];
}

class FridaySunnahFailure extends FridaySunnahState {
  final String message;

  const FridaySunnahFailure(this.message);

  @override
  List<Object?> get props => [message];
}
