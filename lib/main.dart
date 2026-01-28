import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:quran_library/quran.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:zker/core/routs/go_route.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/features/favourite/data/models/favourite_item_model.dart';
import 'package:zker/features/spaha_feature/data/models/spha_model.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
      await QuranLibrary.init();
  await Hive.initFlutter();
  Hive.registerAdapter(SphaModelAdapter());
Hive.registerAdapter(FavouriteItemModelAdapter());
await setupServiceLocator();
tz.initializeTimeZones();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
     
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.white),
      debugShowCheckedModeBanner: false,
 routerConfig: appRouter,
    );
  }
}
