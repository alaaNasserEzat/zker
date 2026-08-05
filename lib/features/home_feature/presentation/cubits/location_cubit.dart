import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/home_feature/domain/use_cases/get_location_name_use_case.dart';
import 'package:zker/features/home_feature/presentation/cubits/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetLocationNameUseCase getLocationNameUseCase;
  LocationCubit(this.getLocationNameUseCase) : super(LocationInitial());

  Future<void> getLocationName({required String locale}) async {
    emit(LocationLoading());

    final result = await getLocationNameUseCase(locale: locale);

    result.fold(
      (failure) {
        emit(LocationError(failure.message));
      },
      (locationName) {
        emit(LocationLoaded(locationName));
      },
    );
  }
}
