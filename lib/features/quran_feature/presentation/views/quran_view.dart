import 'package:flutter/material.dart';
import 'package:quran_library/quran_library.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return QuranLibraryScreen(
      parentContext: context, // إلزامي
    );
  }
}
