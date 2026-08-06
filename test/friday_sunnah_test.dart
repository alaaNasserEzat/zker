import 'package:flutter_test/flutter_test.dart';
import 'package:zker/features/friday_sunnah_feature/data/models/friday_sunnah_model.dart';

void main() {
  group('FridaySunnahModel', () {
    test('parses a JSON item into a model', () {
      final model = FridaySunnahModel.fromJson({
        'name': 'الاغتسال',
        'description': 'وصف',
      });

      expect(model.name, 'الاغتسال');
      expect(model.description, 'وصف');
    });
  });
}
