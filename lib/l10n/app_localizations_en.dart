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
  String get privacyPolicy => 'Privacy Policy';

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

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get morningAdhkarTitle => 'Morning Adhkar';

  @override
  String get morningAdhkarSubtitle => 'Daily reminder for morning adhkar';

  @override
  String get eveningAdhkarTitle => 'Evening Adhkar';

  @override
  String get eveningAdhkarSubtitle => 'Daily reminder for evening adhkar';

  @override
  String get prophetReminderTitle => 'Prophet Prayer Reminder';

  @override
  String get prophetReminderSubtitle => 'Prophet reminder';

  @override
  String get hourlyAdhkarTitle => 'Hourly Adhkar';

  @override
  String get hourlyAdhkarSubtitle => 'Periodic reminder';

  @override
  String everyMinutes(int minutes) {
    return 'Every $minutes minute';
  }

  @override
  String get hour => 'hour';

  @override
  String get hours => 'hours';

  @override
  String get am => 'AM';

  @override
  String get pm => 'PM';

  @override
  String get goalsTitle => 'Goals';

  @override
  String get createGoal => 'Create Goal';

  @override
  String get editGoal => 'Edit Goal';

  @override
  String get updateGoal => 'Update Goal';

  @override
  String get goalTitle => 'Goal Title';

  @override
  String get writeGoalName => 'Please enter goal title';

  @override
  String get writeGoalCount => 'Enter a valid target';

  @override
  String get exampleReadQuran => 'Example: Read Quran';

  @override
  String get description => 'Description';

  @override
  String get goalType => 'Goal Type';

  @override
  String get targetValue => 'Target Value';

  @override
  String get exampleTargetValue => 'Example: 10';

  @override
  String get recurrence => 'Recurrence';

  @override
  String get deleteGoal => 'Delete Goal';

  @override
  String areYouSureDeleteGoal(String goalTitle) {
    return 'Are you sure you want to delete \"$goalTitle\"?';
  }

  @override
  String get delete => 'Delete';

  @override
  String get retry => 'Retry';

  @override
  String get noGoalsYet => 'No Goals Yet';

  @override
  String get createFirstGoal =>
      'Create your first goal and start your journey.';

  @override
  String get yourGoals => 'Your Goals';

  @override
  String get yourProgress => 'Your Progress';

  @override
  String get completed => 'Completed';

  @override
  String get total => 'Total';

  @override
  String get progress => 'Progress';

  @override
  String get updateProgress => 'Update Progress';

  @override
  String get setCurrentValue => 'Set current value';

  @override
  String get goalDetails => 'Goal Details';

  @override
  String get daily => 'Daily';

  @override
  String get weekly => 'Weekly';

  @override
  String get monthly => 'Monthly';

  @override
  String get once => 'Once';

  @override
  String get quran => 'Quran';

  @override
  String get azkarGoalType => 'Azkar';

  @override
  String get tasbeeh => 'Tasbeeh';

  @override
  String get prayer => 'Prayer';

  @override
  String get custom => 'Custom';

  @override
  String get created => 'Created';

  @override
  String get lastReset => 'Last Reset';

  @override
  String get edit => 'Edit';

  @override
  String get worship => 'Worship';

  @override
  String get goToYourCheckList => 'Go to your check list';

  @override
  String get congratulations => '🎉 Congratulations!';

  @override
  String get customizeAdhkarReminders => 'Customize adhkar reminders';

  @override
  String get todayGoals => 'Today\'s Goals';

  @override
  String get continueGoals => 'Complete your goals, tap to continue';

  @override
  String completedGoalsCount(int completed, int total) {
    return '$completed of $total goals';
  }

  @override
  String get goToChecklist => 'Go to your checklist';

  @override
  String get about => 'About';

  @override
  String get aboutZekr => 'About Zekr';

  @override
  String get zekrTagline => 'Your daily companion for remembrance';

  @override
  String get aboutDescription =>
      'Zekr is a simple Islamic application designed to help you stay connected with your daily remembrance and worship.';

  @override
  String get quranDescription => 'Read the Holy Quran';

  @override
  String get azkarDescription => 'Daily remembrance and supplications';

  @override
  String get tasbeehDescription => 'Simple digital Tasbeeh';

  @override
  String get prayerTimesDescription => 'Prayer times based on your location';

  @override
  String get namesOfAllahDescription => 'Learn the beautiful names of Allah';

  @override
  String get version => 'Version';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get allahAcceptOurDeeds => 'May Allah accept our deeds 🤍';

  @override
  String get contactEmailSubject => 'Zekr App - Contact';
}
