import 'package:zker/features/azkar_feature/domain/entites/azkar_category_entity.dart';

abstract class AzkarCategoryState {}

class AzkarCategoryInitial extends AzkarCategoryState {}

class AzkarCategoryLoading extends AzkarCategoryState {}

class AzkarCategoryLoaded extends AzkarCategoryState {
  final List<AzkarCategoryEntity> categories;

  AzkarCategoryLoaded(this.categories);
}

class AzkarCategoryError extends AzkarCategoryState {
  final String message;
  AzkarCategoryError(this.message);
}
