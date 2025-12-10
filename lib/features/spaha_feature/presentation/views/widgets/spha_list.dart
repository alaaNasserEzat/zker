import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/spaha_feature/presentation/delete_spha_cubit/delete_spha_state.dart';
import 'package:zker/features/spaha_feature/presentation/views/widgets/spha_container.dart';
import 'package:zker/features/spaha_feature/presentation/get_spha_cubit/spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/get_spha_cubit/spha_state.dart';
import 'package:zker/features/spaha_feature/presentation/delete_spha_cubit/delete_spha_cubit.dart';

class SphaList extends StatelessWidget {
  const SphaList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteSphaCubit, DeleteSphaState>(
      listener: (context, state) {
        if (state is DeleteSphaSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("تم حذف السبحة بنجاح")),
          );
          context.read<SphaCubit>().getSpha();
        } 
        else if (state is DeleteSphaError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorModel.message)),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<SphaCubit, SphaState>(
          builder: (context, state) {
            if (state is SphaLoading) {
              return const Center(child: CircularProgressIndicator());
            } 
            else if (state is SphaLoaded) {
              final sphas = state.sphas;

              return sphas.isEmpty
                  ? const Center(child: Text('لا يوجد سبحة'))
                  : ListView.builder(
                      itemCount: sphas.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SphaContainer(sphaModel: sphas[index]),
                        );
                      },
                    );
            } 
            else if (state is SphaError) {
              return Center(child: Text(state.error.message));
            } 
            else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
