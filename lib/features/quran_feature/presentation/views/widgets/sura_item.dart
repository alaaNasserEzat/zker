import 'package:flutter/material.dart';
import 'package:zker/core/constent/type_of_surah.dart';
import 'package:zker/features/quran_feature/presentation/views/quran_view.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key, required this.surah});
  final int surah; // index 0-based

  @override
  Widget build(BuildContext context) {
    // خد المعلومات من surahInfo
    final info = surahInfo[surah + 1]; // لأن map 1-based
    final surahName = info?["name"] ?? "";
    final ayahCount = info?["ayahs"] ?? 0;
    final type = info?["type"] ?? "Meccan";
final   targetPage = info?["startPage"] ?? 1;
    return InkWell(
      onTap: () {
Navigator.push(context, MaterialPageRoute(builder:  (context) {
          return QuranView(targetPage: targetPage );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(.5, .5),blurRadius: 10)],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                type == "Meccan"
                    ? "assets/images/kaba_image.jpg"
                    : "assets/images/madina_imge.jpg",
                width: 50,
                height: 50,
              ),
              Text("$surahName", style: const TextStyle(fontSize: 18)),
              Text(type == "Meccan" ? "مكية" : "مدنية", style: const TextStyle(fontSize: 18)),
              Text("$ayahCount ايات", style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
