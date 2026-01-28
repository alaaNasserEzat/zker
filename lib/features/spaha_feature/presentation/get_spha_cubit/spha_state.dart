
import 'package:equatable/equatable.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';

abstract class SphaState   {

}

class SphaInitial extends SphaState {}

class SphaLoading extends SphaState {}

class SphaLoaded extends SphaState {
List<SphaEntity> sphas = [
  SphaEntity(
    id: 1,
    name: "سبحان الله",
    currentcount: 0,
    cyclesCount: 0,
    totalCount: 0,
    beadsCount: 33,
  ),
  SphaEntity(
    id: 2,
    name: "الحمد لله",
    currentcount: 0,
    cyclesCount: 0,
    totalCount: 0,
    beadsCount: 33,
  ),
  SphaEntity(
    id: 3,
    name: "الله أكبر",
    currentcount: 0,
    cyclesCount: 0,
    totalCount: 0,
    beadsCount: 33,
  ),
  SphaEntity(
    id: 4,
    name: "لا إله إلا الله",
    currentcount: 0,
    cyclesCount: 0,
    totalCount: 0,
    beadsCount: 100,
  ),
  SphaEntity(
    id: 5,
    name: "أستغفر الله",
    currentcount: 0,
    cyclesCount: 0,
    totalCount: 0,
    beadsCount: 100,
  ),
  SphaEntity(
    id: 6,
    name: "لا حول ولا قوة إلا بالله",
    currentcount: 0,
    cyclesCount: 0,
    totalCount: 0,
    beadsCount: 100,
  ),
  SphaEntity(
    id: 7,
    name: "سبحان الله وبحمده",
    currentcount: 0,
    cyclesCount: 0,
    totalCount: 0,
    beadsCount: 100,
  ),
  SphaEntity(
    id: 8,
    name: "سبحان الله العظيم",
    currentcount: 0,
    cyclesCount: 0,
    totalCount: 0,
    beadsCount: 100,
  ),
];


  SphaLoaded(this.sphas);


}

class SphaError extends SphaState {
  final ErrorModel error;

  SphaError(this.error);


}
