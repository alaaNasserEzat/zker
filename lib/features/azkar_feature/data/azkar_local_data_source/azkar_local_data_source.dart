
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:zker/features/azkar_feature/data/models/azkar_category_model.dart';

abstract class AzkarLocalDataSource {
  Future<List<AzkarCategoryModel>> getCategotyAzkar();
  Future<List<AzkarCategoryModel>> getCategoryDoaa();
  
}

class AzkarLocalDataSourceImp implements AzkarLocalDataSource{
  @override

  
  @override
  Future<List<AzkarCategoryModel>> getCategotyAzkar() async{
String jsonString= await rootBundle.loadString("assets/jeson/test.json");
final List<dynamic> dataList=json.decode(jsonString);
return dataList.map((e) => AzkarCategoryModel.fromJson(e)).toList();
  }
  
  @override
  Future<List<AzkarCategoryModel>> getCategoryDoaa() async{
String jsonString= await rootBundle.loadString("assets/jeson/doaa.json");
final List<dynamic> dataList=json.decode(jsonString);
return dataList.map((e) => AzkarCategoryModel.fromJson(e)).toList();
  }
  
}