import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/constent/extensions/localelization_extention.dart';
import 'package:zker/core/services/location_service.dart';
import 'package:zker/features/home_feature/data/data_source/home_data_source.dart';
import 'package:zker/features/home_feature/data/repo_imp/home_repo_impl.dart';
import 'package:zker/features/home_feature/domain/use_cases/get_location_name_use_case.dart';
import 'package:zker/features/home_feature/domain/use_cases/get_prayer_time_use_case.dart';
import 'package:zker/features/home_feature/presentation/cubits/location_cubit.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_cubit.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_bloc_builder.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_card.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/prayer_header.dart';

class PrayerTimeView extends StatelessWidget {
  const PrayerTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n.localeName;
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PrayerCubit(
              GetPrayerTimeUseCase(
                HomeRepoImpl(
                  homeDataSource: HomeDataSourceImpl(
                    locationService: LocationService(),
                  ),
                ),
              ),
            )..loadPrayerTimes(),
          ),
          BlocProvider(
            create: (context) => LocationCubit(
              GetLocationNameUseCase(
                HomeRepoImpl(
                  homeDataSource: HomeDataSourceImpl(
                    locationService: LocationService(),
                  ),
                ),
              ),
            )..getLocationName(locale: locale),
          ),
        ],
        child: Scaffold(
          body: Column(
            spacing: 15,
            children: [
              PrayerHeader(),
              SizedBox(height: 10),
              PrayerBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
