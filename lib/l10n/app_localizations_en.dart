// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get reading => 'keep reading';

  @override
  String get appTitle => 'Dhikr';

  @override
  String get home => 'Home';

  @override
  String get favorites => 'Favorites';

  @override
  String get prayerTimes => 'Prayer Times';

  @override
  String get profile => 'Profile';

  @override
  String get selectLanguage => 'Choose language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get privacy => 'Privacy';

  @override
  String get privacyPolicy => 'Learn about the app privacy policy';

  @override
  String get theme => 'Theme';

  @override
  String get aboutApp => 'About the app';

  @override
  String get aboutAppInfo => 'App information';

  @override
  String get selectAppTheme => 'Choose app theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get cancel => 'Cancel';

  @override
  String get apply => 'Apply';

  @override
  String get addNewDhikr => 'Add a new dhikr';

  @override
  String get dhikrName => 'Dhikr name';

  @override
  String get writeDhikrName => 'Please enter the dhikr name';

  @override
  String get dhikrCount => 'Count';

  @override
  String get writeDhikrCount => 'Please enter the count';

  @override
  String get writeValidNumber => 'Please enter a valid number';

  @override
  String get close => 'Close';

  @override
  String get add => 'Add';

  @override
  String get addedDhikrSuccess => 'Dhikr added successfully!';

  @override
  String get deletedDhikrSuccess => 'Dhikr deleted successfully';

  @override
  String get noDhikr => 'No dhikr available';

  @override
  String get resetCountConfirmation => 'Do you want to reset the count?';

  @override
  String get reset => 'Reset';

  @override
  String get noFavorites => 'No items in favorites';

  @override
  String get addedToFavorites => 'Added to favorites';

  @override
  String get removedFromFavorites => 'Removed from favorites';

  @override
  String get azkar => 'Azkar';

  @override
  String get doaa => 'Duaa';

  @override
  String get namesOfAllah => 'Names of Allah';

  @override
  String get tasbih => 'Tasbih';

  @override
  String get sunnahOfFriday => 'Sunnah of Friday';

  @override
  String get quranKarim => 'Quran Karim';

  @override
  String get continueFromWhereYouStopped => 'Continue from where you stopped';

  @override
  String get remainingUntilPrayer => 'Remaining until prayer';

  @override
  String get prayerTimeLoadError =>
      'An error occurred while loading prayer times';

  @override
  String get fajr => 'Fajr';

  @override
  String get sunrise => 'Sunrise';

  @override
  String get dhuhr => 'Dhuhr';

  @override
  String get asr => 'Asr';

  @override
  String get maghrib => 'Maghrib';

  @override
  String get isha => 'Isha';

  @override
  String get prayerTime => 'Prayer Time';

  @override
  String finishedAllMessage(Object category, Object count) {
    return 'You have completed all $count in $category\nMay Allah accept it from you';
  }

  @override
  String get finishedAllTitle => 'Done';

  @override
  String beadsCount(int count) {
    return 'Beads Count: $count';
  }

  @override
  String roundsCount(int count) {
    return 'Rounds Count: $count';
  }

  @override
  String totalCount(int count) {
    return 'Total Count: $count';
  }
}
