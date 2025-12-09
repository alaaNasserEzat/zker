
import 'package:zker/features/quran_feature/data/models/ayah_model.dart';
import 'package:zker/features/quran_feature/domain/reop/quran_repo.dart';

class GetQuranUseCase {
  final QuranRepo repository;

  GetQuranUseCase(this.repository);

  Future<List<Ayah>> call() {
    return repository.getQuran();
  }
}
