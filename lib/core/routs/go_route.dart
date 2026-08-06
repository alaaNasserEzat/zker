import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_category_entity.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/name_of_allah_cubit/name_of_allah_cubit.dart';
import 'package:zker/features/azkar_feature/presentation/views/azkar_category_view.dart';
import 'package:zker/features/azkar_feature/presentation/views/azkar_details_view.dart';
import 'package:zker/features/azkar_feature/presentation/views/doaa_category_view.dart';
import 'package:zker/features/azkar_feature/presentation/views/name_of_allah_view.dart';
import 'package:zker/features/favourite/presentation/cubits/favourite_cubit.dart';
import 'package:zker/features/favourite/presentation/views/favourite_view.dart';
import 'package:zker/features/friday_sunnah_feature/presentation/views/friday_sunnah_screen.dart';
import 'package:zker/features/profile_feature/presentation/views/profile_view.dart';
import 'package:zker/features/quran_feature/presentation/views/quran_view.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/presentation/increment_spha_cubit/increment_spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/views/spha_details_view.dart';
import 'package:zker/features/spaha_feature/presentation/add_spha_cubit/add_spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/delete_spha_cubit/delete_spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/get_spha_cubit/spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/views/spha_view.dart';
import 'package:zker/features/quran_feature/presentation/views/bottom_nav_bar.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      name: 'CustomBottomNav',
      builder: (context, state) => const CustomBottomNav(),
    ),

    GoRoute(
      path: AppRoutes.azkarDetails,
      name: 'azkarDetails',
      builder: (context, state) {
        final azkarCategoryEntity = state.extra as AzkarCategoryEntity;
        return BlocProvider(
          create: (context) => sl<FavouriteCubit>()..getFavourites(),
          child: AzkarDetailsView(azkarCategoryEntity: azkarCategoryEntity),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.sphaView,
      name: 'sphaView',
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<DeleteSphaCubit>()),
            BlocProvider(create: (_) => sl<SphaCubit>()..getSpha()),
            BlocProvider(create: (_) => sl<AddSphaCubit>()),
          ],
          child: SphaView(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.sphaDetailsView,
      name: 'sphaDetailsView',
      builder: (context, state) {
        final spaha = state.extra as SphaEntity;
        return BlocProvider(
          create: (context) => sl<IncrementSphaCubit>(),
          child: SphaDetailsView(sphaEntity: spaha),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.nameOfAllahView,
      name: 'nameOfAllahView',
      builder: (context, state) {
        return BlocProvider(
          create: (context) => sl<NameOfAllahCubit>()..getNameOfAllah(),
          child: NameOfAllahView(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.quran,
      name: 'quran',
      builder: (context, state) {
        return QuranView();
      },
    ),
    GoRoute(
      path: AppRoutes.profile,
      name: 'profile',
      builder: (context, state) {
        return ProfileView();
      },
    ),
    GoRoute(
      path: AppRoutes.favouriteView,
      name: 'favouriteView',
      builder: (context, state) {
        return FavouriteView();
      },
    ),
    GoRoute(
      path: AppRoutes.azkarCategoryView,
      name: 'azkarCategoryView',
      builder: (context, state) {
        return AzkarCategoryView();
      },
    ),
    GoRoute(
      path: AppRoutes.fridaySunnahView,
      name: 'fridaySunnahView',
      builder: (context, state) => const FridaySunnahScreen(),
    ),
    GoRoute(
      path: AppRoutes.doaaCategoryView,
      name: 'doaaCategoryView',
      builder: (context, state) {
        return DoaaCategoryView();
      },
    ),
  ],
);
