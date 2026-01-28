
import 'package:hive_ce_flutter/adapters.dart';
part 'favourite_item_model.g.dart';
@HiveType(typeId: 1)
class FavouriteItemModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
   String text;
   @HiveField(2)
   int categoryId;


  FavouriteItemModel({
    required this.id,
    required this.text,
 required this.categoryId
  }) ;
}
  
