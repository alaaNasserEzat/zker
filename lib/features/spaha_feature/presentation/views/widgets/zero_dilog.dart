import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_btn.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/presentation/increment_spha_cubit/increment_spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/views/widgets/dailog_btn.dart';
import 'package:zker/l10n/app_localizations.dart';

class ZeroDilog extends StatelessWidget {
  const ZeroDilog({super.key, required this.spha});
  final SphaEntity spha;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      content: Directionality(
        textDirection: TextDirection.rtl,
        child: Text(
          AppLocalizations.of(context)!.resetCountConfirmation,
          style: TextStyle(fontSize: 20),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DailogBtn(
              text: AppLocalizations.of(context)!.cancel,
              onPressed: () {
                context.pop();
              },
            ),
            DailogBtn(
              text: AppLocalizations.of(context)!.reset,
              onPressed: () {
                context.read<IncrementSphaCubit>().zero(spha);
              },
            ),
          ],
        ),
      ],
    );
  }
}
