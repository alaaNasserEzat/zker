import 'package:zker/features/quran_feature/domain/entity/ayah_entity.dart';

abstract class QuranState {}

class QuranInitial extends QuranState {}

class QuranLoading extends QuranState {}

class QuranLoaded extends QuranState {
  final List<AyahEntity> ayat;
  QuranLoaded(this.ayat);
}

class QuranError extends QuranState {
  final String message;
  QuranError(this.message);
}
