import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/presentation/increment_spha_cubit/increment_Spha_state.dart';
import 'package:zker/features/spaha_feature/presentation/increment_spha_cubit/increment_spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/views/widgets/circle_present_indecator.dart';
import 'package:zker/features/spaha_feature/presentation/views/widgets/zero_dilog.dart';
import 'package:zker/l10n/app_localizations.dart';

class SphaDetailsBlocWidget extends StatelessWidget {
  const SphaDetailsBlocWidget({super.key, required this.sphaEntity});
  final SphaEntity sphaEntity;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<IncrementSphaCubit, IncrementSphaState>(
      builder: (context, state) {
        return Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Text(
              sphaEntity.name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            Row(
              children: [
                Text(
                  l10n.beadsCount(sphaEntity.beadsCount),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Spacer(),
                Text(
                  l10n.roundsCount(sphaEntity.cyclesCount),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
            CirclePresentIndecator(
              sphaEntity: sphaEntity,
              ontap: () {
                BlocProvider.of<IncrementSphaCubit>(
                  context,
                ).incrementSpha(sphaEntity);
              },
            ),
            Text(
              l10n.totalCount(sphaEntity.totalCount),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            GestureDetector(
              onTap: () {
                final cubit = context
                    .read<IncrementSphaCubit>(); // ✅ context الصح

                showDialog(
                  context: context,
                  builder: (_) {
                    return BlocProvider.value(
                      value: cubit,
                      child: ZeroDilog(spha: sphaEntity),
                    );
                  },
                );
              },
              child: Icon(Icons.restart_alt_outlined, size: 50),
            ),
          ],
        );
      },
    );
  }
}
