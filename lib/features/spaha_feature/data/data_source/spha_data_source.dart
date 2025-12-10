import 'package:hive_ce/hive.dart';
import 'package:zker/features/spaha_feature/data/models/spha_model.dart';

abstract class SphaDataSource {
  List<SphaModel> getSpha();
  Future<void> addSpha(SphaModel sphaModel);
}

class SphaDataSourceImp implements SphaDataSource {
  final Box<SphaModel> box;

  SphaDataSourceImp({required this.box});

  @override

  Future<void> addSpha(SphaModel sphaModel ) async {

//final model=SphaModel(modelId: sphaModel.modelId, modelName: sphaModel.modelName, modelCurrentcount: 0, modelCyclesCount: 0, modelTotalCount: 0, modelBeadsCount: sphaModel.modelBeadsCount);

    await box.put(sphaModel.modelId, sphaModel); // use id as key
  }

  @override
  List<SphaModel> getSpha()  {
    return  box.values.toList();
  }
}