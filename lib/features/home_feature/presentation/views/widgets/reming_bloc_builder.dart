import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_cubit.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_state.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/remainin_section.dart';
import 'package:zker/features/spaha_feature/presentation/views/widgets/circle_present_indecator.dart';
import 'package:zker/l10n/app_localizations.dart';

class RemingBlocBuilder extends StatelessWidget {
  const RemingBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state is PrayerTimeLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PrayerTimeError) {
          return Center(child: Text(state.errorModel.message));
        }
        if (state is PrayerTimeLoaded) {
          final t = state.prayerTimesEntity;

          return RemaininSection(prayerTimesEntity: t);
        }

        return Center(
          child: Text(AppLocalizations.of(context)!.prayerTimeLoadError),
        );
      },
    );
  }
}
