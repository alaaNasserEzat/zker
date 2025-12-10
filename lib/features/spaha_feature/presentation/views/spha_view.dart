import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/features/spaha_feature/presentation/add_spha_cubit/add_spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/get_spha_cubit/spha_cubit.dart';

import 'package:zker/features/spaha_feature/presentation/views/widgets/add_dilog.dart';
import 'package:zker/features/spaha_feature/presentation/views/widgets/spha_list.dart';

class SphaView extends StatelessWidget {
  const SphaView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  }
}
