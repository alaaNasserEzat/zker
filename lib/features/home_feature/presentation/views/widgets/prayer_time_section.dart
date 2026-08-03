import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/services/location_service.dart';
import 'package:zker/features/home_feature/data/data_source/home_data_source.dart';
import 'package:zker/features/home_feature/data/repo_imp/home_repo_impl.dart';
import 'package:zker/features/home_feature/domain/use_cases/get_prayer_time_use_case.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_cubit.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_row_widget.dart';

class PrayerTimeSection extends StatelessWidget {
  const PrayerTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerCubit(
        GetPrayerTimeUseCase(
          HomeRepoImpl(
            homeDataSource: HomeDataSourceImpl(
              locationService: LocationService(),
            ),
          ),
        ),
      )..loadPrayerTimes(),
      child: PrayerRowWidget(),
    );
  }
}
