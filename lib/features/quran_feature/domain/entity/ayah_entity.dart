class AyahEntity {
  final int id;
  final int jozz;
  final int sora;
  final String soraNameAr;
  final int page;
  final int lineStart;   // ✅ أضفناها
  final int lineEnd;     // ✅ أضفناها
  final int ayaNo;
  final String ayaText;
  final String ayaTextEmlaey;

  AyahEntity({
    required this.id,
    required this.jozz,
    required this.sora,
    required this.soraNameAr,
    required this.page,
    required this.lineStart,   // ✅
    required this.lineEnd,     // ✅
    required this.ayaNo,
    required this.ayaText,
    required this.ayaTextEmlaey,
  });
}
