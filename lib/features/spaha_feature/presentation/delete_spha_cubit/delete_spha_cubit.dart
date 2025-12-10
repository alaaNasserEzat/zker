import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/spaha_feature/domain/use_cases/delet_spha_use_case.dart';
import 'package:zker/features/spaha_feature/presentation/delete_spha_cubit/delete_spha_state.dart';

class DeleteSphaCubit extends Cubit<DeleteSphaState> {
  DeleteSphaCubit(this.deletSphaUseCase) : super(DeleteSphaInitial());
  final DeletSphaUseCase deletSphaUseCase;
delete(id)async{
emit(DeleteSphaLoading());
 await deletSphaUseCase.call( id: id);
 emit(DeleteSphaSuccess());
}

}