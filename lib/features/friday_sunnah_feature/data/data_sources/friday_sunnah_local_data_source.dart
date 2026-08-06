import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:zker/features/friday_sunnah_feature/data/models/friday_sunnah_model.dart';

abstract class FridaySunnahLocalDataSource {
  Future<List<FridaySunnahModel>> getFridaySunnah();
}

class FridaySunnahLocalDataSourceImpl implements FridaySunnahLocalDataSource {
  @override
  Future<List<FridaySunnahModel>> getFridaySunnah() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/jeson/friday_sunnah.json',
      );
      final List<dynamic> decoded = json.decode(jsonString);

      return decoded
          .map(
            (item) => FridaySunnahModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList();
    } catch (_) {
      throw const FormatException('Unable to load Friday Sunnah data.');
    }
  }
}
