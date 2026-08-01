import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:zker/features/profile_feature/presentation/theme_cubit/theme_cubit.dart';
import 'package:zker/features/spaha_feature/data/models/spha_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuranLibrary.init();
  await Hive.initFlutter();
  Hive.registerAdapter(SphaModelAdapter());
  Hive.registerAdapter(FavouriteItemModelAdapter());
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
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, newMode) {
          return MaterialApp.router(
            themeMode: newMode,
            theme: getLightThem(),
            darkTheme: getDarkThem(),
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
