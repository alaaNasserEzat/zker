import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @reading.
  ///
  /// In en, this message translates to:
  /// **'keep reading'**
  String get reading;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Dhikr'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @prayerTimes.
  ///
  /// In en, this message translates to:
  /// **'Prayer Times'**
  String get prayerTimes;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get selectLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Learn about the app privacy policy'**
  String get privacyPolicy;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About the app'**
  String get aboutApp;

  /// No description provided for @aboutAppInfo.
  ///
  /// In en, this message translates to:
  /// **'App information'**
  String get aboutAppInfo;

  /// No description provided for @selectAppTheme.
  ///
  /// In en, this message translates to:
  /// **'Choose app theme'**
  String get selectAppTheme;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @addNewDhikr.
  ///
  /// In en, this message translates to:
  /// **'Add a new dhikr'**
  String get addNewDhikr;

  /// No description provided for @dhikrName.
  ///
  /// In en, this message translates to:
  /// **'Dhikr name'**
  String get dhikrName;

  /// No description provided for @writeDhikrName.
  ///
  /// In en, this message translates to:
  /// **'Please enter the dhikr name'**
  String get writeDhikrName;

  /// No description provided for @dhikrCount.
  ///
  /// In en, this message translates to:
  /// **'Count'**
  String get dhikrCount;

  /// No description provided for @writeDhikrCount.
  ///
  /// In en, this message translates to:
  /// **'Please enter the count'**
  String get writeDhikrCount;

  /// No description provided for @writeValidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number'**
  String get writeValidNumber;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addedDhikrSuccess.
  ///
  /// In en, this message translates to:
  /// **'Dhikr added successfully!'**
  String get addedDhikrSuccess;

  /// No description provided for @deletedDhikrSuccess.
  ///
  /// In en, this message translates to:
  /// **'Dhikr deleted successfully'**
  String get deletedDhikrSuccess;

  /// No description provided for @noDhikr.
  ///
  /// In en, this message translates to:
  /// **'No dhikr available'**
  String get noDhikr;

  /// No description provided for @resetCountConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Do you want to reset the count?'**
  String get resetCountConfirmation;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @noFavorites.
  ///
  /// In en, this message translates to:
  /// **'No items in favorites'**
  String get noFavorites;

  /// No description provided for @addedToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Added to favorites'**
  String get addedToFavorites;

  /// No description provided for @removedFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Removed from favorites'**
  String get removedFromFavorites;

  /// No description provided for @azkar.
  ///
  /// In en, this message translates to:
  /// **'Azkar'**
  String get azkar;

  /// No description provided for @doaa.
  ///
  /// In en, this message translates to:
  /// **'Duaa'**
  String get doaa;

  /// No description provided for @namesOfAllah.
  ///
  /// In en, this message translates to:
  /// **'Names of Allah'**
  String get namesOfAllah;

  /// No description provided for @tasbih.
  ///
  /// In en, this message translates to:
  /// **'Tasbih'**
  String get tasbih;

  /// No description provided for @sunnahOfFriday.
  ///
  /// In en, this message translates to:
  /// **'Sunnah of Friday'**
  String get sunnahOfFriday;

  /// No description provided for @quranKarim.
  ///
  /// In en, this message translates to:
  /// **'Quran Karim'**
  String get quranKarim;

  /// No description provided for @continueFromWhereYouStopped.
  ///
  /// In en, this message translates to:
  /// **'Continue from where you stopped'**
  String get continueFromWhereYouStopped;

  /// No description provided for @remainingUntilPrayer.
  ///
  /// In en, this message translates to:
  /// **'Remaining until prayer'**
  String get remainingUntilPrayer;

  /// No description provided for @prayerTimeLoadError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading prayer times'**
  String get prayerTimeLoadError;

  /// No description provided for @fajr.
  ///
  /// In en, this message translates to:
  /// **'Fajr'**
  String get fajr;

  /// No description provided for @sunrise.
  ///
  /// In en, this message translates to:
  /// **'Sunrise'**
  String get sunrise;

  /// No description provided for @dhuhr.
  ///
  /// In en, this message translates to:
  /// **'Dhuhr'**
  String get dhuhr;

  /// No description provided for @asr.
  ///
  /// In en, this message translates to:
  /// **'Asr'**
  String get asr;

  /// No description provided for @maghrib.
  ///
  /// In en, this message translates to:
  /// **'Maghrib'**
  String get maghrib;

  /// No description provided for @isha.
  ///
  /// In en, this message translates to:
  /// **'Isha'**
  String get isha;

  /// No description provided for @prayerTime.
  ///
  /// In en, this message translates to:
  /// **'Prayer Time'**
  String get prayerTime;

  /// No description provided for @finishedAllMessage.
  ///
  /// In en, this message translates to:
  /// **'You have completed all {count} in {category}\nMay Allah accept it from you'**
  String finishedAllMessage(Object category, Object count);

  /// No description provided for @finishedAllTitle.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get finishedAllTitle;

  /// No description provided for @beadsCount.
  ///
  /// In en, this message translates to:
  /// **'Beads Count: {count}'**
  String beadsCount(int count);

  /// No description provided for @roundsCount.
  ///
  /// In en, this message translates to:
  /// **'Rounds Count: {count}'**
  String roundsCount(int count);

  /// No description provided for @totalCount.
  ///
  /// In en, this message translates to:
  /// **'Total Count: {count}'**
  String totalCount(int count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
