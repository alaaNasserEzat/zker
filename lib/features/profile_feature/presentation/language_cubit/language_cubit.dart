import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:zker/features/profile_feature/presentation/language_cubit/app_locale.dart';

class LanguageCubit extends HydratedCubit<Locale> {
  LanguageCubit() : super(AppLocale.arabic);

  static const String _storageKey = 'languageCode';

  void changeLanguage(Locale local) {
    if (state == local) return;
    emit(local);
  }

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    switch (json[_storageKey]) {
      case "ar":
        return AppLocale.arabic;
      case "en":
        return AppLocale.english;
    }
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {_storageKey: state.languageCode};
  }
}
