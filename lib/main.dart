import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_library/quran.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:zker/core/routs/go_route.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/core/utils/app_colors.dart';
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
  await QuranLibrary.init();
  await Hive.initFlutter();
  Hive.registerAdapter(SphaModelAdapter());
  Hive.registerAdapter(FavouriteItemModelAdapter());
  Hive.registerAdapter(GoalTypeAdapter());
  Hive.registerAdapter(GoalRecurrenceAdapter());
  Hive.registerAdapter(GoalModelAdapter());
  await setupServiceLocator();
  tz.initializeTimeZones();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  runApp(const MyApp());
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
