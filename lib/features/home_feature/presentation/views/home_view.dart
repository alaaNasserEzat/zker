import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/services/location_service.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/home_feature/data/data_source/home_data_source.dart';
import 'package:zker/features/home_feature/data/repo_imp/home_repo_impl.dart';
import 'package:zker/features/home_feature/domain/use_cases/get_prayer_time_use_case.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_cubit.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/back_ground_image.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_grid_view.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_row.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/home_container.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_row_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ✅ الخلفية
         BackGroundImage(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 5,
              children: [
                const SizedBox(height: 10),
                Text("ذِكْر", style: AppTextStyles.zekerTitle),
                HomeContainer(),
                Align(
                  alignment: Alignment.topRight,
                  child: Text("مواقيت  الصلاه", style: AppTextStyles.titles),
                ),

                BlocProvider(
                  create: (context) => PrayerCubit(GetPrayerTimeUseCase(HomeRepoImpl(homeDataSource: HomeDataSourceImpl(locationService: LocationService()))))..loadPrayerTimes(),
                  child: PrayerRowWidget()),
                CustomRow(),
                CustomGridView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
