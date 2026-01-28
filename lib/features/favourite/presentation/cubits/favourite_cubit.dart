import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/favourite/data/models/favourite_item_model.dart';
import 'package:zker/features/favourite/domain/repo/favourite_repo.dart';
import 'package:zker/features/favourite/presentation/cubits/favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.favouriteRepo) : super(FavouriteInitial());

  final FavouriteRepo favouriteRepo;

  // ================= GET =================
  void getFavourites() {
    emit(FavouriteLoading());
    try {
      final favs = favouriteRepo.getFavourite();
      emit(FavouriteLoaded(favs));
    } catch (e) {
      emit(FavouriteError(
        ErrorModel(message: e.toString()),
      ));
    }
  }

  // ================= ADD =================
  Future<void> addToFavourite(FavouriteItemModel model) async {
    emit(FavouriteLoading());

    final Either<ErrorModel, Unit> result =
        await favouriteRepo.addToFavourite(model);

    result.fold(
      (error) => emit(FavouriteError(error)),
      (_) {
      emit(AddToFavouriteState()); // ✅ مرة واحدة
      getFavourites();             // تحديث الداتا
    },
    );
  

  }

  // ================= REMOVE =================
  Future<void> removeFromFavourite(FavouriteItemModel model) async {
    emit(FavouriteLoading());

    final Either<ErrorModel, Unit> result =
        await favouriteRepo.removeFromFavourite(model);

    result.fold(
      (error) => emit(FavouriteError(error)),
      (_){
      emit(RemoveFromFavouriteState());
     getFavourites();
    },

      
    );

  }

  // ================= CHECK (اختياري) =================
  bool isFavourite(FavouriteItemModel model) {
    return favouriteRepo.isFavourite(model);
      
  }
}
