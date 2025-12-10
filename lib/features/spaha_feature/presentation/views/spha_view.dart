import 'package:flutter/material.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';

import 'package:zker/features/spaha_feature/presentation/views/widgets/add_dilog.dart';
import 'package:zker/features/spaha_feature/presentation/views/widgets/spha_list.dart';

class SphaView extends StatelessWidget {
  const SphaView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return
    // MultiBlocProvider(
    //  providers: [
        // BlocProvider<SphaCubit>(
        //   create: (_) => sl<SphaCubit>()..getSpha(),
        // ),
        // BlocProvider<AddSphaCubit>(
        //   create: (_) => sl<AddSphaCubit>(),
        // ),
      //],
     // child: 
      Scaffold(
        appBar: buildAppBar(context, title),
        body: SphaList(),
        floatingActionButton: CircleAvatar(
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showAddSphaDialog(context); // دلوقتي ال dialog هيلاقي AddSphaCubit
            },
          ),
        ),
      );
    //);
  }
}
