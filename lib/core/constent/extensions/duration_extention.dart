extension DurationExtension on Duration {
  String get hhmmss {
    String two(int n) => n.toString().padLeft(2, '0');

    return "${two(inHours)}:"
        "${two(inMinutes.remainder(60))}:"
        "${two(inSeconds.remainder(60))}";
  }
}
