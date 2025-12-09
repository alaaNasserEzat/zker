import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:zker/features/quran_feature/data/models/ayah_model.dart';

abstract class QuranLocalDataSource {
  Future<List<Ayah>> getQuranLocalDataSource();
}

class QuranLocalDataSourceImpl extends QuranLocalDataSource{
  @override
  Future<List<Ayah>> getQuranLocalDataSource()async {
String content=await rootBundle.loadString("assets/jeson/quran_hafs.json");
final List<dynamic> dataList=json.decode(content);
return dataList.map((aya)=>Ayah.fromJson(aya)).toList();
  }

}