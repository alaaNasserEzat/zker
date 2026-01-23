import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/domain/use_cases/increment_use_case.dart';
import 'package:zker/features/spaha_feature/presentation/increment_spha_cubit/increment_Spha_state.dart';

class IncrementSphaCubit extends Cubit<IncrementSphaState> {
  IncrementSphaCubit(this.incrementUseCase) : super(IncrementSphaInitial());
  final IncrementUseCase incrementUseCase;

  incrementSpha(SphaEntity spha) async {

    final res = await incrementUseCase.call(spha: spha);
    res.fold(
      (l) => emit(IncrementSphaError(l)),
      (r) => emit(IncrementSphaSuccess(r)),
    );

 
  }
}
