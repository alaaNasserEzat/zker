// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get reading => 'متابعة القراءة';

  @override
  String get appTitle => 'ذِكْر';

  @override
  String get home => 'الرئيسية';

  @override
  String get favorites => 'المفضلة';

  @override
  String get prayerTimes => 'أوقات الصلاة';

  @override
  String get profile => 'حسابي';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get privacy => 'الخصوصية';

  @override
  String get privacyPolicy => 'لمعرفة سياسة التطبيق';

  @override
  String get theme => 'السمة';

  @override
  String get aboutApp => 'حول التطبيق';

  @override
  String get aboutAppInfo => 'معلومات عن التطبيق';

  @override
  String get selectAppTheme => 'اختر سمة التطبيق';

  @override
  String get light => 'فاتح';

  @override
  String get dark => 'داكن';

  @override
  String get system => 'نظام الجهاز';

  @override
  String get cancel => 'إلغاء';

  @override
  String get apply => 'تطبيق';

  @override
  String get addNewDhikr => 'إضافة ذكر جديد';

  @override
  String get dhikrName => 'اسم الذكر';

  @override
  String get writeDhikrName => 'اكتب اسم الذكر';

  @override
  String get dhikrCount => 'العدد';

  @override
  String get writeDhikrCount => 'اكتب العدد';

  @override
  String get writeValidNumber => 'اكتب رقم صحيح';

  @override
  String get close => 'إغلاق';

  @override
  String get add => 'إضافة';

  @override
  String get addedDhikrSuccess => 'تمت إضافة الذكر بنجاح!';

  @override
  String get deletedDhikrSuccess => 'تم حذف الذكر بنجاح';

  @override
  String get noDhikr => 'لا يوجد ذكر';

  @override
  String get resetCountConfirmation => 'هل تريد تصفير العدد؟';

  @override
  String get reset => 'تصفير';

  @override
  String get noFavorites => 'لا يوجد عناصر في المفضلة';

  @override
  String get addedToFavorites => 'تمت الإضافة إلى المفضلة';

  @override
  String get removedFromFavorites => 'تمت الإزالة من المفضلة';

  @override
  String get azkar => 'أذكار';

  @override
  String get doaa => 'أدعية';

  @override
  String get namesOfAllah => 'أسماء الله';

  @override
  String get tasbih => 'سبحة';

  @override
  String get sunnahOfFriday => 'سنن الجمعة';

  @override
  String get quranKarim => 'القرآن الكريم';

  @override
  String get continueFromWhereYouStopped => 'اكمل من حيث توقفت';

  @override
  String get remainingUntilPrayer => 'باقي على صلاة';

  @override
  String get prayerTimeLoadError => 'حدث خطأ في تحميل المواقيت';

  @override
  String get fajr => 'الفجر';

  @override
  String get sunrise => 'الشروق';

  @override
  String get dhuhr => 'الظهر';

  @override
  String get asr => 'العصر';

  @override
  String get maghrib => 'المغرب';

  @override
  String get isha => 'العشاء';

  @override
  String get prayerTime => 'Prayer Time';

  @override
  String finishedAllMessage(Object category, Object count) {
    return 'خلصت كل $count في $category\nتقبل الله منك';
  }

  @override
  String get finishedAllTitle => 'تم';

  @override
  String beadsCount(int count) {
    return 'عدد الحبات: $count';
  }

  @override
  String roundsCount(int count) {
    return 'عدد الدورات: $count';
  }

  @override
  String totalCount(int count) {
    return 'العدد الكلي: $count';
  }
}
