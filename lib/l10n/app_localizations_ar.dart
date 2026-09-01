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
  String get prayerTimes => 'مواقيت الصلاة';

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
  String get privacyPolicy => 'سياسة الخصوصية';

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
  String get azkar => 'الأذكار';

  @override
  String get doaa => 'أدعية';

  @override
  String get namesOfAllah => 'أسماء الله الحسنى';

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

  @override
  String get notificationsTitle => 'الإشعارات';

  @override
  String get morningAdhkarTitle => 'أذكار الصباح';

  @override
  String get morningAdhkarSubtitle => 'تذكير يومي بأذكار الصباح';

  @override
  String get eveningAdhkarTitle => 'أذكار المساء';

  @override
  String get eveningAdhkarSubtitle => 'تذكير يومي بأذكار المساء';

  @override
  String get prophetReminderTitle => 'الصلاة على النبي ﷺ';

  @override
  String get prophetReminderSubtitle => 'تذكير بالصلاة على النبي';

  @override
  String get hourlyAdhkarTitle => 'أذكار كل ساعة';

  @override
  String get hourlyAdhkarSubtitle => 'تذكير بالذكر كل فترة';

  @override
  String everyMinutes(int minutes) {
    return 'كل $minutes دقيقة';
  }

  @override
  String get hour => 'ساعة';

  @override
  String get hours => 'ساعات';

  @override
  String get am => 'ص';

  @override
  String get pm => 'م';

  @override
  String get goalsTitle => 'الأهداف';

  @override
  String get createGoal => 'إنشاء هدف';

  @override
  String get editGoal => 'تعديل الهدف';

  @override
  String get updateGoal => 'تحديث الهدف';

  @override
  String get goalTitle => 'اسم الهدف';

  @override
  String get writeGoalName => 'اكتب اسم الهدف';

  @override
  String get writeGoalCount => 'اكتب القيمه المستهدفة';

  @override
  String get exampleReadQuran => 'مثال: قراءة القرآن';

  @override
  String get description => 'الوصف';

  @override
  String get goalType => 'نوع الهدف';

  @override
  String get targetValue => 'القيمة المستهدفة';

  @override
  String get exampleTargetValue => 'مثال: 10';

  @override
  String get recurrence => 'التكرار';

  @override
  String get deleteGoal => 'حذف الهدف';

  @override
  String areYouSureDeleteGoal(String goalTitle) {
    return 'هل أنت متأكد من حذف \"$goalTitle\"؟';
  }

  @override
  String get delete => 'حذف';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get noGoalsYet => 'لا توجد أهداف بعد';

  @override
  String get createFirstGoal => 'أنشئ هدفك الأول وابدأ رحلتك.';

  @override
  String get yourGoals => 'أهدافك';

  @override
  String get yourProgress => 'تقدمك';

  @override
  String get completed => 'مكتمل';

  @override
  String get total => 'الإجمالي';

  @override
  String get progress => 'التقدم';

  @override
  String get updateProgress => 'تحديث التقدم';

  @override
  String get setCurrentValue => 'تعيين القيمة الحالية';

  @override
  String get goalDetails => 'تفاصيل الهدف';

  @override
  String get daily => 'يومي';

  @override
  String get weekly => 'أسبوعي';

  @override
  String get monthly => 'شهري';

  @override
  String get once => 'مرة واحدة';

  @override
  String get quran => 'القرآن الكريم';

  @override
  String get azkarGoalType => 'أذكار';

  @override
  String get tasbeeh => 'التسبيح';

  @override
  String get prayer => 'صلاة';

  @override
  String get custom => 'مخصص';

  @override
  String get created => 'تم الإنشاء';

  @override
  String get lastReset => 'آخر تعديل';

  @override
  String get edit => 'تعديل';

  @override
  String get worship => 'العبادات';

  @override
  String get goToYourCheckList => 'انتقل إلى قائمة المراجعة الخاصة بك';

  @override
  String get congratulations => '🎉 مبروك!';

  @override
  String get customizeAdhkarReminders => 'تخصيص تذكيرات الأذكار';

  @override
  String get todayGoals => 'أهداف اليوم';

  @override
  String get continueGoals => 'كمل أهدافك، اضغط للمتابعة';

  @override
  String completedGoalsCount(int completed, int total) {
    return 'أنجزت $completed من $total أهداف';
  }

  @override
  String get goToChecklist => 'اذهب إلى قائمة أهدافك';

  @override
  String get about => 'عن التطبيق';

  @override
  String get aboutZekr => 'عن تطبيق ذكر';

  @override
  String get zekrTagline => 'رفيقك اليومي للذكر والعبادة';

  @override
  String get aboutDescription =>
      'ذكر هو تطبيق إسلامي بسيط يساعدك على الحفاظ على ذكرك وعبادتك اليومية.';

  @override
  String get quranDescription => 'اقرأ القرآن الكريم';

  @override
  String get azkarDescription => 'الأذكار اليومية والأدعية';

  @override
  String get tasbeehDescription => 'عداد تسبيح بسيط';

  @override
  String get prayerTimesDescription => 'مواقيت الصلاة حسب موقعك';

  @override
  String get namesOfAllahDescription => 'تعرّف على أسماء الله الحسنى';

  @override
  String get version => 'الإصدار';

  @override
  String get contactUs => 'تواصل معنا';

  @override
  String get allahAcceptOurDeeds => 'تقبل الله منا ومنكم 🤍';

  @override
  String get contactEmailSubject => 'تطبيق ذكر - تواصل معنا';
}
