import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:zker/features/quran_feature/data/local_data_source/quran_local_data_source.dart';
import 'package:zker/features/quran_feature/data/repo_impl/quran_repo_imp.dart';
import 'package:zker/features/quran_feature/domain/reop/quran_repo.dart';
import 'package:zker/features/quran_feature/domain/use_case/get_quran_use_case.dart';
import 'package:zker/features/quran_feature/presentation/cubits/auran_cubit.dart';
import 'package:zker/features/spaha_feature/data/data_source/spha_data_source.dart';
import 'package:zker/features/spaha_feature/data/models/spha_model.dart';
import 'package:zker/features/spaha_feature/data/spha_repo_impl.dart';
import 'package:zker/features/spaha_feature/domain/repo/spha_repo.dart';
import 'package:zker/features/spaha_feature/domain/use_cases/add_spha_use_case.dart';
import 'package:zker/features/spaha_feature/domain/use_cases/get_spha_use_case.dart';
import 'package:zker/features/spaha_feature/presentation/add_spha_cubit/add_spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/get_spha_cubit/spha_cubit.dart';


final sl = GetIt.instance;

Future<void> setupServiceLocator() async{
    // 1. فتح الـ Hive Box
  // 1. فتح الـ Hive Box
  final sphaBox = await Hive.openBox<SphaModel>('spha_box');
  sl.registerSingleton<Box<SphaModel>>(sphaBox);

  // 2. تسجيل DataSource
  sl.registerLazySingleton<SphaDataSource>(
      () => SphaDataSourceImp(box: sl()));

  // 3. تسجيل Repository
  sl.registerLazySingleton<SphaRepo>(
      () => SphaRepoImpl(sphaDataSource: sl()));

  // 4. تسجيل Use Cases
  sl.registerLazySingleton<GetSphaUseCase>(
      () => GetSphaUseCase(sphaRepo: sl()));
  sl.registerLazySingleton<AddSphaUseCase>(
      () => AddSphaUseCase(sl()));

  // 5. تسجيل Cubit
  sl.registerFactory<SphaCubit>(() => SphaCubit(sl()));
  sl.registerFactory<AddSphaCubit>(() => AddSphaCubit(sl()));

  /// ✅ Data Source
  sl.registerLazySingleton<QuranLocalDataSource>(
    () => QuranLocalDataSourceImpl(),
  );

  /// ✅ Repository
  sl.registerLazySingleton<QuranRepo>(
    () => QuranRepoImp(
      quranLocalDataSource: sl(),
    ),
  );

  /// ✅ Use Case
  sl.registerLazySingleton<GetQuranUseCase>(
    () => GetQuranUseCase(sl()),
  );

  /// ✅ Cubit
  sl.registerFactory<QuranCubit>(
    () => QuranCubit(sl()),
  );
}
