import 'package:flutter/material.dart';

extension StringExtention on String {
  String insert(String s, int i) => substring(0, i) + s + substring(i);
}

extension ContextExtention on BuildContext{
 bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

}