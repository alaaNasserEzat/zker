import 'package:zker/features/quran_feature/data/models/ayah_model.dart';



class QuranPage {
  final int pageNumber;
  int numberOfNewSurahs;
  List<Ayah> ayahs;
  List<Line> lines;
  int? hizb;
  bool hasSajda, lastLine;

  QuranPage({
    required this.pageNumber,
    required this.ayahs,
    required this.lines,
    this.hizb,
    this.hasSajda = false,
    this.lastLine = false,
    this.numberOfNewSurahs = 0,
  });
}

class Line {
  List<Ayah> ayahs;
  bool centered;

  Line(this.ayahs, {this.centered = false});
}