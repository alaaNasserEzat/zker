import 'package:flutter/material.dart';
import 'package:zker/l10n/app_localizations.dart';

extension LocalelizationExtention on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
