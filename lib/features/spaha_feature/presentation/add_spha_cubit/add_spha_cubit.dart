import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/spaha_feature/data/models/spha_model.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/domain/use_cases/add_spha_use_case.dart';

import 'add_spha_state.dart';

class AddSphaCubit extends Cubit<AddSphaState> {
  final AddSphaUseCase addSphaUseCase;

  AddSphaCubit(this.addSphaUseCase) : super(AddSphaInitial());

  Future<void> addSpha(SphaEntity spha) async {
    try {
      emit(AddSphaLoading());
      await addSphaUseCase(sphaModel: spha);
      emit(AddSphaSuccess(spha));
    } catch (e) {
      emit(AddSphaError(ErrorModel(message: e.toString())));
    }
  }
}
