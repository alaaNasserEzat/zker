import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/spaha_feature/data/data_source/spha_data_source.dart';
import 'package:zker/features/spaha_feature/data/models/spha_model.dart';
import 'package:zker/features/spaha_feature/data/spha_mapper/spha_mapper.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/domain/repo/spha_repo.dart';

class SphaRepoImpl extends SphaRepo {
  final SphaDataSource sphaDataSource;

  SphaRepoImpl({required this.sphaDataSource});
  @override
  Future<void> addSpha({required SphaEntity spha}) async {
    final model = SphaModel(
      modelId: spha.id,
      modelName: spha.name,
      modelCurrentcount: 0,
      modelCyclesCount: 0,
      modelTotalCount: 0,
      modelBeadsCount: spha.beadsCount,
    );
    await sphaDataSource.addSpha(model);
  }

  @override
  Either<ErrorModel, List<SphaEntity>> getSpha() {
    List<SphaEntity> sphaEntities = [];
    try {
      List<SphaModel> sphaList = sphaDataSource.getSpha();
for (var element in sphaList) {
  sphaEntities.add(SphaMapper.toEntity(element));
}
      return right(sphaEntities);
    } catch (e) {
      return left(ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<void> deletSpha({required int id}) async {
    await sphaDataSource.deletSpha(id);
  }

  @override

  Future<Either<ErrorModel, SphaEntity>> increment({required SphaEntity spha}) async {

    try {
      if(spha.currentcount==spha.beadsCount){
        spha.currentcount=0;
      }
  spha.currentcount++;
  spha.totalCount++;
  spha.cyclesCount=spha.totalCount~/spha.beadsCount;
  await sphaDataSource.putSpha(SphaMapper.toModel(spha));
  return right(spha);
} 

on Exception catch (e) {
return left(ErrorModel(message: e.toString()));
}


  //   try {
      
  //     final sphaModel = await sphaDataSource.getSphaById(spha.id);
      
  //     if (sphaModel.modelCurrentcount == sphaModel.modelBeadsCount) {
  //       sphaModel.modelCurrentcount = 0;
       
    
  //     }
  //     sphaModel.modelCurrentcount++;
  //     sphaModel.modelTotalCount++;
  //     sphaModel.modelCyclesCount=sphaModel.modelTotalCount~/sphaModel.modelBeadsCount;



  //     print("spha model ${spha.currentcount}");
  //  await sphaDataSource.putSpha(   sphaModel);

 
  //     return right(SphaMapper.toEntity(sphaModel));
  //   } on Exception catch (e) {
  //     return left(ErrorModel(message: e.toString()));
  //   }
  }
}
