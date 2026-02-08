import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
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
import 'package:zker/features/home_feature/data/data_source/home_data_source.dart';
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

  // 2. تسجيل DataSource
  sl.registerLazySingleton<SphaDataSource>(() => SphaDataSourceImp(box: sl()));
  sl.registerLazySingleton<AzkarLocalDataSource>(
    () => AzkarLocalDataSourceImp(),
  );
  
    sl.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(locationService: sl()),
  );
    sl.registerLazySingleton<FavouriteLocalDataSource>(
    () => FavouriteLocalDataSourceImpl(box: sl()),
  );
  // 3. تسجيل Repository
  sl.registerLazySingleton<SphaRepo>(() => SphaRepoImpl(sphaDataSource: sl()));
  sl.registerLazySingleton<AzkarRepo>(() => AzkarRepoImpl(sl()));
  sl.registerLazySingleton<FavouriteRepo>(() => FavouriteRepoImpl( favouriteLocalDataSource: sl()));

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

  // 5. تسجيل Cubit
  sl.registerFactory<SphaCubit>(() => SphaCubit(sl()));
  sl.registerFactory<AddSphaCubit>(() => AddSphaCubit(sl()));
  sl.registerFactory<DeleteSphaCubit>(() => DeleteSphaCubit(sl()));
  sl.registerFactory<IncrementSphaCubit>(
    () => IncrementSphaCubit(incrementUseCase: sl(), zeroSphaUseCase: sl()),
  );
    sl.registerFactory<AzkarCategoryCubit>(
    () => AzkarCategoryCubit( sl()),
  );
    sl.registerFactory<DoaaCubit>(
    () => DoaaCubit( sl()),
  );
      sl.registerFactory<FavouriteCubit>(
    () => FavouriteCubit( sl()),
  );
        sl.registerFactory<NameOfAllahCubit>(
    () => NameOfAllahCubit( sl()),
  );

  /// ✅ Data Source

}
