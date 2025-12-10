import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/spha_container.dart';
import 'package:zker/features/spaha_feature/presentation/get_spha_cubit/spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/get_spha_cubit/spha_state.dart';
// تأكدي المسار

class SphaList extends StatelessWidget {
  const SphaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<SphaCubit, SphaState>(
        builder: (context, state) {
          if (state is SphaLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SphaLoaded) {
            final sphas = state.sphas; // المفروض الـ cubit بيرجع ليست من الـ SphaModel
            return sphas.isEmpty? const Center(child: Text('لا يوجد سباحة')):
            
            ListView.builder(
              itemCount: sphas.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SphaContainer(sphaModel: sphas[index]), // لو الـ SphaContainer بياخد عنصر
                );
              },
            );
          } else if (state is SphaError) {
            return Center(child: Text(state.error.message  ));
          } else {
            return const SizedBox.shrink(); // حالة البداية
          }
        },
      ),
    );
  }
}
