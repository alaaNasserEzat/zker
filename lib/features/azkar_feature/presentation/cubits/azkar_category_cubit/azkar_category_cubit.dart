import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/azkar_feature/domain/usecases/get_azkar_category_use_case.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/azkar_category_cubit/azkar_category_state.dart';

class AzkarCategoryCubit extends Cubit<AzkarCategoryState> {
  final GetAzkarCategoryUseCase getAzkarCategoriesUseCase;

  AzkarCategoryCubit(this.getAzkarCategoriesUseCase)
      : super(AzkarCategoryInitial());

  Future<void> getCategories() async {
    emit(AzkarCategoryLoading());

    final result = await getAzkarCategoriesUseCase();

    result.fold(
      (failure) =>
          emit(AzkarCategoryError(failure.message)),
      (categories) =>
          emit(AzkarCategoryLoaded(categories)),
    );
  }
}
