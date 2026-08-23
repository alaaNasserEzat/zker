import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_library/quran.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:zker/core/cloc_observer.dart';
import 'package:zker/core/routs/go_route.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/features/notifications/data/datasources/notification_local_data_source.dart';
import 'package:zker/core/utils/them_data_dark.dart';
import 'package:zker/core/utils/them_data_light.dart';
import 'package:zker/features/favourite/data/models/favourite_item_model.dart';
import 'package:zker/features/goals_feature/data/models/goal_model.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_enums.dart';
import 'package:zker/features/profile_feature/presentation/language_cubit/app_locale.dart';
import 'package:zker/features/profile_feature/presentation/language_cubit/language_cubit.dart';
import 'package:zker/features/profile_feature/presentation/theme_cubit/theme_cubit.dart';
import 'package:zker/features/spaha_feature/data/models/spha_model.dart';
import 'package:zker/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. تشغيل المهام المستقلة بالتوازي لتقليل وقت التجهيز
  await Future.wait([QuranLibrary.init(), Hive.initFlutter(), _initTimezone()]);

  // 2. تسجيل Adapters الخاصة بـ Hive (سريعة جداً ولا تحتاج await)
  Hive.registerAdapter(SphaModelAdapter());
  Hive.registerAdapter(FavouriteItemModelAdapter());
  Hive.registerAdapter(GoalTypeAdapter());
  Hive.registerAdapter(GoalRecurrenceAdapter());
  Hive.registerAdapter(GoalModelAdapter());

  // 3. تشغيل باقي التهييئات بالتوازي
  await Future.wait([
    setupServiceLocator().then(
      (_) => sl<NotificationLocalDataSource>().initialize(),
    ),
    _initHydratedStorage(),
  ]);

  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

// دالة منفصلة لتهيئة التوقيت
Future<void> _initTimezone() async {
  tzdata.initializeTimeZones();
  try {
    final timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  } catch (_) {
    // التراجع للتوقيت المحلي في حال فشل الجلب
    tz.setLocalLocation(tz.getLocation('UTC'));
  }
}

// دالة منفصلة لتهيئة HydratedStorage
Future<void> _initHydratedStorage() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LanguageCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, newMode) {
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp.router(
                locale: locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocale.supportedLocal,
                themeMode: newMode,
                theme: getLightThem(),
                darkTheme: getDarkThem(),
                debugShowCheckedModeBanner: false,
                routerConfig: appRouter,
              );
            },
          );
        },
      ),
    );
  }
}
