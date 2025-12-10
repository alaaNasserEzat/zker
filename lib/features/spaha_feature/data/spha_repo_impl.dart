import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/spaha_feature/data/data_source/spha_data_source.dart';
import 'package:zker/features/spaha_feature/data/models/spha_model.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/domain/repo/spha_repo.dart';

class SphaRepoImpl extends SphaRepo{
  final SphaDataSource sphaDataSource;

  SphaRepoImpl({required this.sphaDataSource});
  @override
  Future<void> addSpha({required SphaModel sphaModel}) async{

  await sphaDataSource.addSpha(sphaModel);
  
  }

  @override
  Either<ErrorModel, List<SphaEntity>> getSpha() {
try {
  List<SphaEntity> sphaList = sphaDataSource.getSpha();
  return right(sphaList);
}  catch (e) {
return left(ErrorModel(message: e.toString()));
}
  }
}