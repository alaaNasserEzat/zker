import 'package:dartz/dartz.dart';
import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/favourite/data/models/favourite_item_model.dart';

abstract class FavouriteRepo {
List<FavouriteItemModel> getFavourite();
  Future<Either<ErrorModel,Unit>> addToFavourite(FavouriteItemModel model);
  Future<Either<ErrorModel,Unit>> removeFromFavourite(FavouriteItemModel model);
  bool isFavourite(FavouriteItemModel model);

}