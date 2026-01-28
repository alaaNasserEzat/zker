import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/favourite/data/data_source/favourite_local_data_source.dart';
import 'package:zker/features/favourite/data/models/favourite_item_model.dart';
import 'package:zker/features/favourite/domain/repo/favourite_repo.dart';

class FavouriteRepoImpl implements FavouriteRepo{
 final FavouriteLocalDataSource favouriteLocalDataSource;

  FavouriteRepoImpl({required this.favouriteLocalDataSource});
  @override
  Future<Either<ErrorModel, Unit>> addToFavourite(FavouriteItemModel model)async {
  try {
  await favouriteLocalDataSource.addToFavourite(model);
  return right(unit);
} on Exception catch (e) {
return left(ErrorModel(message: e.toString()));
}
  }

  @override
  List<FavouriteItemModel> getFavourite() {
    
      final data= favouriteLocalDataSource.getFavourite();

      return data;
   

  }

  @override
  Future<Either<ErrorModel, Unit>> removeFromFavourite(FavouriteItemModel model) async{
try{
  await favouriteLocalDataSource.removeFromFavourite(model);
  return right(unit);
} on Exception catch (e) {
return left(ErrorModel(message: e.toString()));
}
  }
  
  @override
  bool isFavourite(FavouriteItemModel model) {
 return favouriteLocalDataSource.isFavourite(model);
  }
}