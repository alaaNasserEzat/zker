import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/azkar_feature/domain/usecases/gat_doaa_category_use_case.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/doaa_state.dart';

class DoaaCubit extends Cubit<DoaaState> {
  final GatDoaaCategoryDoaaUseCase getCategoryDoaaUseCase;

  DoaaCubit(this.getCategoryDoaaUseCase)
      : super(DoaaInitial());

  Future<void> getCategoryDoaa() async {
    emit(DoaaLoading());

    final result = await getCategoryDoaaUseCase();

    result.fold(
      (failure) =>
          emit(DoaaError(failure.message)),
      (azkar) =>
          emit(DoaaLoaded(azkar)),
    );
  }
}
