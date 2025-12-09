
import 'package:flutter/material.dart';
import 'package:zker/features/quran_feature/data/models/quran_page.dart';

class QuranLine extends StatelessWidget {
  final Line line;
  final BoxFit boxFit;

  const QuranLine(
    this.line, {
    super.key,
    this.boxFit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: boxFit,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: line.ayahs.map((ayah) {
            return TextSpan(
              text: ayah.ayah,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
                height: 2,
                fontFamily: 'hafs', // لو عندك خط المصحف
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
