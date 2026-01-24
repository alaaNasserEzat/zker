import 'package:zker/features/azkar_feature/domain/entites/azkar_item_entity.dart';

abstract class AzkarItemState {}

class AzkarItemInitial extends AzkarItemState {}

class AzkarItemLoading extends AzkarItemState {}

class AzkarItemLoaded extends AzkarItemState {
  final List<AzkarItemEntity> azkar;

  AzkarItemLoaded(this.azkar);
}

class AzkarItemError extends AzkarItemState {
  final String message;
  AzkarItemError(this.message);
}
