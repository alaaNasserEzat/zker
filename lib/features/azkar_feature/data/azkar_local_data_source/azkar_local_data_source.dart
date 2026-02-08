
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:zker/features/azkar_feature/data/models/azkar_category_model.dart';
import 'package:zker/features/azkar_feature/data/models/name_allah.dart';

abstract class AzkarLocalDataSource {
  Future<List<AzkarCategoryModel>> getCategotyAzkar();
  Future<List<AzkarCategoryModel>> getCategoryDoaa();
  Future<List<NameAllah>> getNameAllah();
  
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
  
  @override
  Future<List<NameAllah>> getNameAllah()async {
String data=await rootBundle.loadString("assets/jeson/name_of_allah.json");
final List<dynamic> nameAllahList=json.decode(data);
return nameAllahList.map((e) => NameAllah.fromJson(e)).toList();
  }
  
}