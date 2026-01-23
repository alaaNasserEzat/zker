import 'package:zker/features/spaha_feature/data/models/spha_model.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';

class SphaMapper {
  static toEntity(SphaModel sphaModel) => SphaEntity(
    id: sphaModel.modelId,
    name: sphaModel.modelName,
    currentcount: sphaModel.modelCurrentcount,
    cyclesCount: sphaModel.modelCyclesCount,
    totalCount: sphaModel.modelTotalCount,
    beadsCount: sphaModel.modelBeadsCount,
  );

  static  toModel(SphaEntity sphaEntity) => SphaModel(
    modelId: sphaEntity.id,
    modelName: sphaEntity.name,
    modelCurrentcount: sphaEntity.currentcount,
    modelCyclesCount: sphaEntity.cyclesCount,
    modelTotalCount: sphaEntity.totalCount,
    modelBeadsCount: sphaEntity.beadsCount,
  );
}
