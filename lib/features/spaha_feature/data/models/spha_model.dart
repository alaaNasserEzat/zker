import 'package:hive_ce/hive.dart';
part 'spha_model.g.dart';

@HiveType(typeId: 0)
class SphaModel extends HiveObject {
  @HiveField(0)
  final int modelId;

  @HiveField(1)
   String modelName;

  @HiveField(2)
   int modelCurrentcount;

  @HiveField(3)
   int modelCyclesCount;

  @HiveField(4)
   int modelTotalCount;

  @HiveField(5)
   int modelBeadsCount;

  SphaModel({
    required this.modelId,
    required this.modelName,
    required this.modelCurrentcount,
    required this.modelCyclesCount,
    required this.modelTotalCount,
    required this.modelBeadsCount,
  }) ;
}
  
