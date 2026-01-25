import 'package:zker/features/azkar_feature/domain/entites/azkar_category_entity.dart';


abstract class DoaaState {}

class DoaaInitial extends DoaaState {}

class DoaaLoading extends DoaaState {}

class DoaaLoaded extends DoaaState {
  final List<AzkarCategoryEntity> azkar;

 DoaaLoaded(this.azkar);
}

class DoaaError extends DoaaState {
  final String message;
 DoaaError(this.message);
}
