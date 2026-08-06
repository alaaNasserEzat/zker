import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/constent/extensions/localelization_extention.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/features/friday_sunnah_feature/presentation/cubit/friday_sunnah_cubit.dart';
import 'package:zker/features/friday_sunnah_feature/presentation/cubit/friday_sunnah_state.dart';
import 'package:zker/features/friday_sunnah_feature/presentation/views/widgets/friday_sunah_list.dart';

class FridaySunnahScreen extends StatelessWidget {
  const FridaySunnahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<FridaySunnahCubit>()..loadFridaySunnah(),
      child: Scaffold(
        appBar: buildAppBar(
          context: context,
          title: context.l10n.sunnahOfFriday,
        ),
        body: BlocBuilder<FridaySunnahCubit, FridaySunnahState>(
          builder: (context, state) {
            if (state is FridaySunnahLoading || state is FridaySunnahInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is FridaySunnahFailure) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              );
            }

            if (state is FridaySunnahSuccess) {
              final items = state.items;
              return FridaySunahList(items: items);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
