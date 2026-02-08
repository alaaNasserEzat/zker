import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/azkar_feature/data/azkar_local_data_source/azkar_local_data_source.dart';
import 'package:zker/features/azkar_feature/data/models/name_allah.dart';
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
  Future<Either<ErrorModel, List<AzkarCategoryEntity>>> getCategoryDoaa()async {

try {
 final data= await azkarLocalDataSource.getCategoryDoaa();
 return right(data);
} on Exception catch (e) {
 return left(ErrorModel(message: e.toString()));
}
  }

  @override
  Future<Either<ErrorModel, List<NameAllah>>> getNameAllah()async {
try {
 final data= await azkarLocalDataSource.getNameAllah();
 return right(data);
} on Exception catch (e) {
 return left(ErrorModel(message: e.toString()));
}
  }
}