import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/home_feature/presentation/cubits/location_cubit.dart';
import 'package:zker/features/home_feature/presentation/cubits/location_state.dart';

class LocationNameBlocBuilder extends StatelessWidget {
  const LocationNameBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state is LocationLoading) {
          return const CircularProgressIndicator(
            color: AppColors.mainColor60,
            strokeWidth: .8,
          );
        }

        if (state is LocationLoaded) {
          return Text(
            state.locationName,
            style: AppTextStyles.zekerTextBold17wihte.copyWith(fontSize: 15),
          );
        }

        if (state is LocationError) {
          return Text(state.message);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
