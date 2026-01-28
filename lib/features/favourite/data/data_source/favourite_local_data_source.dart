
import 'package:hive_ce/hive.dart';
import 'package:zker/features/favourite/data/models/favourite_item_model.dart';


abstract class FavouriteLocalDataSource {
  List<FavouriteItemModel> getFavourite();
  Future<void> addToFavourite(FavouriteItemModel sphaModel);
  Future<void> removeFromFavourite(FavouriteItemModel model);
  bool isFavourite(FavouriteItemModel model);

}

class FavouriteLocalDataSourceImpl implements FavouriteLocalDataSource {
  final Box<FavouriteItemModel> box;
    String _key(int id, int categoryId) => '$categoryId-$id';


  FavouriteLocalDataSourceImpl({required this.box});

  @override

  Future<void> addToFavourite(FavouriteItemModel model ) async {
    await box.put(_key(model.categoryId,  model.id), model); // use id as key
  }

  @override
  List<FavouriteItemModel> getFavourite()  {
    return  box.values.toList();
  }
  
  @override
  Future<void> removeFromFavourite(FavouriteItemModel model)async {

    await box.delete(_key(model.categoryId, model.id));
  
  }
    @override
      bool isFavourite(FavouriteItemModel model) {
    return box.containsKey(_key(model.categoryId, model.id));
  }
  


  

  
}