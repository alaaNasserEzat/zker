import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/domain/use_cases/increment_use_case.dart';
import 'package:zker/features/spaha_feature/domain/use_cases/zero_spha_use_case.dart';
import 'package:zker/features/spaha_feature/presentation/increment_spha_cubit/increment_Spha_state.dart';

class IncrementSphaCubit extends Cubit<IncrementSphaState> {
  IncrementSphaCubit({required this.incrementUseCase, required this.zeroSphaUseCase}) : super(IncrementSphaInitial());
  final IncrementUseCase incrementUseCase;
  final ZeroSphaUseCase zeroSphaUseCase;

  incrementSpha(SphaEntity spha) async {

    final res = await incrementUseCase.call(spha: spha);
    res.fold(
      (l) => emit(IncrementSphaError(l)),
      (r) => emit(IncrementSphaSuccess()),
    );

 
  }

  zero(SphaEntity spha) async {

    final res = await zeroSphaUseCase.call(spha: spha);
    res.fold(
      (l) => emit(IncrementSphaError(l)),
      (r) => emit(ZeroState()),
    );

  }
}
