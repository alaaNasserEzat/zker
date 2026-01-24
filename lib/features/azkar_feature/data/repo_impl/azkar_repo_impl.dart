import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/azkar_feature/data/azkar_local_data_source/azkar_local_data_source.dart';
import 'package:zker/features/azkar_feature/data/models/azkar_item_model.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_category_entity.dart';
import 'package:zker/features/azkar_feature/domain/repo/azkar_repo.dart';

class AzkarRepoImpl implements AzkarRepo {
  final AzkarLocalDataSource azkarLocalDataSource;
  AzkarRepoImpl(this.azkarLocalDataSource);
  @override
  Future<Either<ErrorModel, List<AzkarCategoryEntity>>> getAzkarCategories()async {

try {
 final data= await azkarLocalDataSource.getCategotyAzkar();
 return right(data);
} on Exception catch (e) {
 return left(ErrorModel(message: e.toString()));
}
  }

  @override
  Future<Either<ErrorModel, List<AzkarItemModel>>> getAzkarItems()async {

try {
 final data= await azkarLocalDataSource.getAzkarItems();
 return right(data);
} on Exception catch (e) {
 return left(ErrorModel(message: e.toString()));
}
  }
}