import 'package:zker/features/spaha_feature/data/models/spha_model.dart';
import 'package:zker/features/spaha_feature/domain/repo/spha_repo.dart';

class AddSphaUseCase {
  final SphaRepo sphaRepo;
  AddSphaUseCase(this.sphaRepo);

  Future<void> call({required SphaModel sphaModel}) => sphaRepo.addSpha(sphaModel: sphaModel);
}