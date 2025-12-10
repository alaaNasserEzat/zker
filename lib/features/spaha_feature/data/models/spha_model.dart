import 'package:hive_ce/hive.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';

part 'spha_model.g.dart';

@HiveType(typeId: 0)
class SphaModel extends SphaEntity {
  @HiveField(0)
  final int modelId;

  @HiveField(1)
  final String modelName;

  @HiveField(2)
  final int modelCurrentcount;

  @HiveField(3)
  final int modelCyclesCount;

  @HiveField(4)
  final int modelTotalCount;

  SphaModel({
    required this.modelId,
    required this.modelName,
    required this.modelCurrentcount,
    required this.modelCyclesCount,
    required this.modelTotalCount,
  }) : super(
          id: modelId,
          name: modelName,
          currentcount: modelCurrentcount,
          cyclesCount: modelCyclesCount,
          totalCount: modelTotalCount,
        );
}
