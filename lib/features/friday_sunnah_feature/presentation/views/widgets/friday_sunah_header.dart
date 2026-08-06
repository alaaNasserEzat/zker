import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class FridaySunnahHeader extends StatelessWidget {
  const FridaySunnahHeader({super.key});

  Future<void> _shareImage() async {
    final byteData = await rootBundle.load(
      'assets/images/friday_sunnah_imag.jpeg',
    );

    final tempDir = await getTemporaryDirectory();

    final file = File('${tempDir.path}/friday_sunnah_imag.jpeg');

    await file.writeAsBytes(byteData.buffer.asUint8List());

    await SharePlus.instance.share(ShareParams(files: [XFile(file.path)]));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: _shareImage,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            'assets/images/friday_sunnah_imag.jpeg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
