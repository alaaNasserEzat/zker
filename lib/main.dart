import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:zker/core/routs/go_route.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/core/utils/app_colors.dart';

void main() async{
setupServiceLocator();
tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      debugShowCheckedModeBanner: false,
 routerConfig: appRouter,
    );
  }
}
