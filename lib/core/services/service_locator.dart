import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:zker/core/services/local_notification_service.dart';
import 'package:zker/core/services/location_service.dart';
import 'package:zker/features/azkar_feature/data/azkar_local_data_source/azkar_local_data_source.dart';
import 'package:zker/features/azkar_feature/data/repo_impl/azkar_repo_impl.dart';
import 'package:zker/features/azkar_feature/domain/repo/azkar_repo.dart';
import 'package:zker/features/azkar_feature/domain/usecases/gat_doaa_category_use_case.dart';
import 'package:zker/features/azkar_feature/domain/usecases/get_azkar_category_use_case.dart';
import 'package:zker/features/azkar_feature/domain/usecases/get_name_of_llah_use_case.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/azkar_category_cubit/azkar_category_cubit.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/doaa_cubit.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/name_of_allah_cubit/name_of_allah_cubit.dart';
import 'package:zker/features/favourite/data/data_source/favourite_local_data_source.dart';
import 'package:zker/features/favourite/data/models/favourite_item_model.dart';
import 'package:zker/features/favourite/data/repo/favourite_repo_impl.dart';
import 'package:zker/features/favourite/domain/repo/favourite_repo.dart';
import 'package:zker/features/favourite/presentation/cubits/favourite_cubit.dart';
import 'package:zker/features/friday_sunnah_feature/data/data_sources/friday_sunnah_local_data_source.dart';
import 'package:zker/features/friday_sunnah_feature/data/repo/friday_sunnah_repository_impl.dart';
import 'package:zker/features/friday_sunnah_feature/domain/repo/friday_sunnah_repository.dart';
import 'package:zker/features/friday_sunnah_feature/domain/use_cases/get_friday_sunnah_use_case.dart';
import 'package:zker/features/friday_sunnah_feature/presentation/cubit/friday_sunnah_cubit.dart';
import 'package:zker/features/goals_feature/data/datasources/goal_local_data_source.dart';
import 'package:zker/features/goals_feature/data/models/goal_model.dart';
import 'package:zker/features/goals_feature/data/repositories/goal_repository_impl.dart';
import 'package:zker/features/goals_feature/domain/repositories/goal_repository.dart';
import 'package:zker/features/goals_feature/domain/use_cases/add_goal_use_case.dart';
import 'package:zker/features/goals_feature/domain/use_cases/delete_goal_use_case.dart';
import 'package:zker/features/goals_feature/domain/use_cases/get_goals_use_case.dart';
import 'package:zker/features/goals_feature/domain/use_cases/reset_expired_goals_use_case.dart';
import 'package:zker/features/goals_feature/domain/use_cases/update_goal_progress_use_case.dart';
import 'package:zker/features/goals_feature/domain/use_cases/update_goal_use_case.dart';
import 'package:zker/features/goals_feature/presentation/cubits/goals_cubit.dart';
import 'package:zker/features/home_feature/data/data_source/home_data_source.dart';
import 'package:zker/features/home_feature/data/repo_imp/home_repo_impl.dart';
import 'package:zker/features/home_feature/domain/repo/home_repo.dart';
import 'package:zker/features/home_feature/domain/use_cases/get_location_name_use_case.dart';
import 'package:zker/features/home_feature/domain/use_cases/get_prayer_time_use_case.dart';
import 'package:zker/features/home_feature/presentation/cubits/location_cubit.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_cubit.dart';
import 'package:zker/features/profile_feature/presentation/theme_cubit/theme_cubit.dart';
import 'package:zker/features/notifications/data/datasources/notification_local_data_source.dart';
import 'package:zker/features/notifications/data/repositories/notification_repository_impl.dart';
import 'package:zker/features/notifications/domain/repositories/notification_repository.dart';
import 'package:zker/features/notifications/domain/usecases/get_notification_settings.dart';
import 'package:zker/features/notifications/domain/usecases/update_evening_adhkar.dart';
import 'package:zker/features/notifications/domain/usecases/update_hourly_adhkar.dart';
import 'package:zker/features/notifications/domain/usecases/update_morning_adhkar.dart';
import 'package:zker/features/notifications/domain/usecases/update_prophet_reminder.dart';
import 'package:zker/features/notifications/presentation/cubit/notification_cubit.dart';
import 'package:zker/features/spaha_feature/data/data_source/spha_data_source.dart';
import 'package:zker/features/spaha_feature/data/models/spha_model.dart';
import 'package:zker/features/spaha_feature/data/spha_repo_impl.dart';
import 'package:zker/features/spaha_feature/domain/repo/spha_repo.dart';
import 'package:zker/features/spaha_feature/domain/use_cases/add_spha_use_case.dart';
import 'package:zker/features/spaha_feature/domain/use_cases/delet_spha_use_case.dart';
import 'package:zker/features/spaha_feature/domain/use_cases/get_spha_use_case.dart';
import 'package:zker/features/spaha_feature/domain/use_cases/increment_use_case.dart';
import 'package:zker/features/spaha_feature/domain/use_cases/zero_spha_use_case.dart';
import 'package:zker/features/spaha_feature/presentation/add_spha_cubit/add_spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/delete_spha_cubit/delete_spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/get_spha_cubit/spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/increment_spha_cubit/increment_spha_cubit.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // 1. فتح الـ Hive Box
  // 1. فتح الـ Hive Box
  final sphaBox = await Hive.openBox<SphaModel>('spha_box');
  sl.registerSingleton<Box<SphaModel>>(sphaBox);
  final fav = await Hive.openBox<FavouriteItemModel>('fav_box');
  sl.registerSingleton<Box<FavouriteItemModel>>(fav);
  final notificationBox = await Hive.openBox<dynamic>(
    'notification_settings_box',
  );
  sl.registerSingleton<Box<dynamic>>(notificationBox);
  sl.registerLazySingleton<LocalNotificationService>(
    () => LocalNotificationService(),
  );
  sl.registerLazySingleton<NotificationLocalDataSource>(
    () => NotificationLocalDataSourceImpl(box: sl(), notificationService: sl()),
  );
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(localDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetNotificationSettings(sl()));
  sl.registerLazySingleton(() => UpdateMorningAdhkar(sl()));
  sl.registerLazySingleton(() => UpdateEveningAdhkar(sl()));
  sl.registerLazySingleton(() => UpdateProphetReminder(sl()));
  sl.registerLazySingleton(() => UpdateHourlyAdhkar(sl()));
  sl.registerFactory(
    () => NotificationCubit(
      getSettings: sl(),
      updateMorning: sl(),
      updateEvening: sl(),
      updateProphet: sl(),
      updateHourly: sl(),
    ),
  );

  // 2. تسجيل DataSource
  sl.registerLazySingleton<SphaDataSource>(() => SphaDataSourceImp(box: sl()));
  sl.registerLazySingleton<AzkarLocalDataSource>(
    () => AzkarLocalDataSourceImp(),
  );

  // ==========================================================
  // HOME / PRAYER TIMES
  // ==========================================================

  // Location Service
  sl.registerLazySingleton<LocationService>(() => LocationService());

  // Data Source
  sl.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(locationService: sl<LocationService>()),
  );

  // Repository
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeDataSource: sl<HomeDataSource>()),
  );

  // Use Case
  sl.registerLazySingleton<GetPrayerTimeUseCase>(
    () => GetPrayerTimeUseCase(sl<HomeRepo>()),
  );

  // Cubit
  sl.registerFactory<PrayerCubit>(
    () => PrayerCubit(sl<GetPrayerTimeUseCase>()),
  );
  // ==========================================================
  // LOCATION
  // ==========================================================

  sl.registerLazySingleton<GetLocationNameUseCase>(
    () => GetLocationNameUseCase(sl<HomeRepo>()),
  );

  sl.registerFactory<LocationCubit>(
    () => LocationCubit(sl<GetLocationNameUseCase>()),
  );

  sl.registerLazySingleton<FavouriteLocalDataSource>(
    () => FavouriteLocalDataSourceImpl(box: sl()),
  );
  // 3. تسجيل Repository
  sl.registerLazySingleton<SphaRepo>(() => SphaRepoImpl(sphaDataSource: sl()));
  sl.registerLazySingleton<AzkarRepo>(() => AzkarRepoImpl(sl()));
  sl.registerLazySingleton<FavouriteRepo>(
    () => FavouriteRepoImpl(favouriteLocalDataSource: sl()),
  );
  sl.registerLazySingleton<FridaySunnahLocalDataSource>(
    () => FridaySunnahLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<FridaySunnahRepository>(
    () => FridaySunnahRepositoryImpl(localDataSource: sl()),
  );

  // 4. تسجيل Use Cases
  sl.registerLazySingleton<GetSphaUseCase>(
    () => GetSphaUseCase(sphaRepo: sl()),
  );
  sl.registerLazySingleton<AddSphaUseCase>(() => AddSphaUseCase(sl()));
  sl.registerLazySingleton(() => DeletSphaUseCase(sphaRepo: sl()));
  sl.registerLazySingleton(() => IncrementUseCase(sphaRepo: sl()));
  sl.registerLazySingleton(() => ZeroSphaUseCase(sphaRepo: sl()));
  sl.registerLazySingleton(() => GetAzkarCategoryUseCase(sl()));
  sl.registerLazySingleton(() => GatDoaaCategoryDoaaUseCase(sl()));
  sl.registerLazySingleton(() => GetNameOfLlahUseCase(azkarRepo: sl()));
  sl.registerLazySingleton(() => GetFridaySunnahUseCase(repository: sl()));

  // 5. تسجيل Cubit
  sl.registerFactory<SphaCubit>(() => SphaCubit(sl()));
  sl.registerFactory<AddSphaCubit>(() => AddSphaCubit(sl()));
  sl.registerFactory<DeleteSphaCubit>(() => DeleteSphaCubit(sl()));
  sl.registerFactory<IncrementSphaCubit>(
    () => IncrementSphaCubit(incrementUseCase: sl(), zeroSphaUseCase: sl()),
  );
  sl.registerFactory<AzkarCategoryCubit>(() => AzkarCategoryCubit(sl()));
  sl.registerFactory<FridaySunnahCubit>(() => FridaySunnahCubit(sl()));
  sl.registerFactory<DoaaCubit>(() => DoaaCubit(sl()));
  sl.registerFactory<FavouriteCubit>(() => FavouriteCubit(sl()));
  sl.registerFactory<NameOfAllahCubit>(() => NameOfAllahCubit(sl()));
  sl.registerFactory(() => ThemeCubit());

  /// ✅ Data Source
  final goals = await Hive.openBox<GoalModel>('goals_box');
  sl.registerSingleton<Box<GoalModel>>(goals);
  sl.registerLazySingleton<GoalLocalDataSource>(
    () => GoalLocalDataSourceImpl(box: sl()),
  );

  sl.registerLazySingleton<GoalRepository>(
    () => GoalRepositoryImpl(localDataSource: sl<GoalLocalDataSource>()),
  );

  sl.registerLazySingleton<GetGoalsUseCase>(
    () => GetGoalsUseCase(sl<GoalRepository>()),
  );

  sl.registerLazySingleton<AddGoalUseCase>(
    () => AddGoalUseCase(sl<GoalRepository>()),
  );

  sl.registerLazySingleton<UpdateGoalUseCase>(
    () => UpdateGoalUseCase(sl<GoalRepository>()),
  );

  sl.registerLazySingleton<DeleteGoalUseCase>(
    () => DeleteGoalUseCase(sl<GoalRepository>()),
  );

  sl.registerLazySingleton<UpdateGoalProgressUseCase>(
    () => UpdateGoalProgressUseCase(sl<GoalRepository>()),
  );

  sl.registerLazySingleton<ResetExpiredGoalsUseCase>(
    () => ResetExpiredGoalsUseCase(sl<GoalRepository>()),
  );

  sl.registerFactory<GoalsCubit>(
    () => GoalsCubit(
      getGoalsUseCase: sl<GetGoalsUseCase>(),
      addGoalUseCase: sl<AddGoalUseCase>(),
      updateGoalUseCase: sl<UpdateGoalUseCase>(),
      deleteGoalUseCase: sl<DeleteGoalUseCase>(),
      updateGoalProgressUseCase: sl<UpdateGoalProgressUseCase>(),
      resetExpiredGoalsUseCase: sl<ResetExpiredGoalsUseCase>(),
    ),
  );
}
