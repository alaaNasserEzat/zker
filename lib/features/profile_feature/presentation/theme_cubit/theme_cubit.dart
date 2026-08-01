import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);
  String jesonkey = "themeMode";
  void toggleTheme(ThemeMode newTheme) {
    emit(newTheme);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    if (json[jesonkey] == "light") {
      return ThemeMode.light;
    } else if (json[jesonkey] == "dark") {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    if (state == ThemeMode.dark) {
      return {jesonkey: "dark"};
    } else if (state == ThemeMode.light) {
      return {jesonkey: "light"};
    } else {
      return {jesonkey: "system"};
    }
  }
}
