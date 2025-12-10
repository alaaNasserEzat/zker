import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/spaha_feature/domain/use_cases/get_spha_use_case.dart';
import 'spha_state.dart';


class SphaCubit extends Cubit<SphaState> {
  final GetSphaUseCase getSphaUseCase;

  SphaCubit(this.getSphaUseCase) : super(SphaInitial());

  void getSpha() {
    emit(SphaLoading());

    final result = getSphaUseCase.call();

    result.fold(
      (error) => emit(SphaError(error)),
      (sphas) => emit(SphaLoaded(List.from(sphas))),
    );
  }
}
