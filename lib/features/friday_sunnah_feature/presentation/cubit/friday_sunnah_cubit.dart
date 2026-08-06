import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/friday_sunnah_feature/domain/use_cases/get_friday_sunnah_use_case.dart';
import 'package:zker/features/friday_sunnah_feature/presentation/cubit/friday_sunnah_state.dart';

class FridaySunnahCubit extends Cubit<FridaySunnahState> {
  final GetFridaySunnahUseCase getFridaySunnahUseCase;

  FridaySunnahCubit(this.getFridaySunnahUseCase)
    : super(const FridaySunnahInitial());

  Future<void> loadFridaySunnah() async {
    emit(const FridaySunnahLoading());

    final result = await getFridaySunnahUseCase();

    result.fold(
      (failure) => emit(FridaySunnahFailure(failure.message)),
      (items) => emit(FridaySunnahSuccess(items)),
    );
  }
}
