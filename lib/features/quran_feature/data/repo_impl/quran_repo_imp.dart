import 'package:zker/features/quran_feature/data/local_data_source/quran_local_data_source.dart';
import 'package:zker/features/quran_feature/data/models/ayah_model.dart';

import 'package:zker/features/quran_feature/domain/reop/quran_repo.dart';

class QuranRepoImp extends QuranRepo {
  final QuranLocalDataSource quranLocalDataSource;

  QuranRepoImp({required this.quranLocalDataSource});
  @override
  Future<List<Ayah>> getQuran() {
 return quranLocalDataSource.getQuranLocalDataSource();
  }

}