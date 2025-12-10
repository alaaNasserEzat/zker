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
  Future<void> addSpha({required SphaEntity spha}) async{
final model=SphaModel(modelId: spha.id, modelName: spha.name, modelCurrentcount: 0, modelCyclesCount: 0, modelTotalCount: 0, modelBeadsCount: spha.beadsCount);
 await sphaDataSource.addSpha(model);
  
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