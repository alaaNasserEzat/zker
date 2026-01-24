import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/azkar_feature/domain/usecases/gat_azkar_item_use_case.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/azkar_state.dart';

class AzkarItemCubit extends Cubit<AzkarItemState> {
  final GatAzkarItemUseCase getAzkarItemsUseCase;

  AzkarItemCubit(this.getAzkarItemsUseCase)
      : super(AzkarItemInitial());

  Future<void> getAzkarItems(int categoryId) async {
    emit(AzkarItemLoading());

    final result = await getAzkarItemsUseCase();

    result.fold(
      (failure) =>
          emit(AzkarItemError(failure.message)),
      (azkar) =>
          emit(AzkarItemLoaded(azkar)),
    );
  }
}
