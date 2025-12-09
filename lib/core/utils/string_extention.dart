extension StringExtention on String {
  String insert(String s, int i) => substring(0, i) + s + substring(i);
}