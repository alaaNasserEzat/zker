import 'package:get_it/get_it.dart';
import 'package:zker/features/quran_feature/data/local_data_source/quran_local_data_source.dart';
import 'package:zker/features/quran_feature/data/repo_impl/quran_repo_imp.dart';
import 'package:zker/features/quran_feature/domain/reop/quran_repo.dart';
import 'package:zker/features/quran_feature/domain/use_case/get_quran_use_case.dart';
import 'package:zker/features/quran_feature/presentation/cubits/auran_cubit.dart';


final sl = GetIt.instance;

void setupServiceLocator() {
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
