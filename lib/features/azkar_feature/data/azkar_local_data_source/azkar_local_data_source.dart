
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:zker/features/azkar_feature/data/models/azkar_category_model.dart';
import 'package:zker/features/azkar_feature/data/models/azkar_item_model.dart';


abstract class AzkarLocalDataSource {
  Future<List<AzkarCategoryModel>> getCategotyAzkar();
  Future<List<AzkarItemModel>> getAzkarItems();
  
}

class AzkarLocalDataSourceImp implements AzkarLocalDataSource{
  @override

  
  @override
  Future<List<AzkarCategoryModel>> getCategotyAzkar() async{
String jsonString= await rootBundle.loadString("assets/jeson/adhkar.json");
final List<dynamic> dataList=json.decode(jsonString);
return dataList.map((e) => AzkarCategoryModel.fromJson(e)).toList();
  }
  
  @override
  Future<List<AzkarItemModel>> getAzkarItems() async{
  String jsonString = await rootBundle.loadString("assets/jeson/adhkar.json");
  final List<dynamic> dataList = json.decode(jsonString);

  // هنا بنجمع كل الـ AzkarItems من كل category
  List<AzkarItemModel> items = [];
  for (var category in dataList) {
    final azkarArray = (category['array'] as List<dynamic>? ?? []);
    items.addAll(azkarArray.map((e) => AzkarItemModel.fromJson(e)));
  }
  return items;
  }
  
}