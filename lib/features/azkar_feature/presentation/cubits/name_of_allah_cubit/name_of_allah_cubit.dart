import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/azkar_feature/domain/usecases/get_name_of_llah_use_case.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/name_of_allah_cubit/name_of_allah_state.dart';

class NameOfAllahCubit extends Cubit<NameOfAllahState>{
  NameOfAllahCubit(this.getNameOfLlahUseCase):super(NameOfAllahInitial());
  final GetNameOfLlahUseCase getNameOfLlahUseCase;
  getNameOfAllah()async{
    emit(NameOfAllahLoading());
    final res=await getNameOfLlahUseCase.call();
    res.fold(
      (l) => emit(NameOfAllahError(message: l.message)),
      (r) => emit(NameOfAllahLoaded(nameAllahList: r)),
    );
  }
}