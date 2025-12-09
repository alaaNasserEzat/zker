
import 'package:go_router/go_router.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/features/home_feature/presentation/views/azkar_details_view.dart';
import 'package:zker/features/home_feature/presentation/views/azkar_view.dart';
import 'package:zker/features/home_feature/presentation/views/spha_details_view.dart';
import 'package:zker/features/home_feature/presentation/views/spha_view.dart';
import 'package:zker/features/quran_feature/presentation/views/bottom_nav_bar.dart';
import 'package:zker/features/quran_feature/presentation/views/surah_list_view.dart';



final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      name: 'CustomBottomNav',
      builder: (context, state) => const CustomBottomNav(),
    ),

    GoRoute(
      path: AppRoutes.azkar,
      name: 'azkar',
      builder: (context, state){
        final title = state.extra as String;
        return
        AzkarView(title: title,);
      }  
    ),

    GoRoute(
      path: AppRoutes.azkarDetails,
      name: 'azkarDetails',
      builder: (context, state) {
        final title = state.extra as String;
        return AzkarDetailsView(title: title);
      },
    ),
     GoRoute(
      path: AppRoutes.sphaView,
      name: 'sphaView',
      builder: (context, state) {
        final title = state.extra as String;
        return SphaView(title: title);
      },
    ),
    GoRoute(
      path: AppRoutes.sphaDetailsView,
      name: 'sphaDetailsView',
      builder: (context, state) {
        final title = state.extra as String;
        return SphaDetailsView(title: title);
      },
    ),
       GoRoute(
      path: AppRoutes.quran,
      name: 'surahList',
      builder: (context, state) {
        return SurahListView();
      },
    ),
  ],
);
