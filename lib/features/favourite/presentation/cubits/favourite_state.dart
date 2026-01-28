import 'package:zker/core/errors/error_model.dart';
import 'package:zker/features/favourite/data/models/favourite_item_model.dart';

abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final List<FavouriteItemModel> favourites;

  FavouriteLoaded(this.favourites);
}

class FavouriteError extends FavouriteState {
  final ErrorModel error;

  FavouriteError(this.error);
}

class AddToFavouriteState extends FavouriteState {}

class RemoveFromFavouriteState extends FavouriteState {}

