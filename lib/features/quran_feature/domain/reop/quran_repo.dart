
import 'package:zker/features/quran_feature/data/models/ayah_model.dart';

abstract class QuranRepo {
  Future<List<Ayah>> getQuran();
}