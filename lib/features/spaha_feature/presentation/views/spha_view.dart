import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/features/spaha_feature/presentation/views/widgets/add_dilog.dart';
import 'package:zker/features/spaha_feature/presentation/views/widgets/spha_list.dart';

class SphaView extends StatelessWidget {
  const SphaView({super.key, });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context:context, title:"السبحه"),
      body: SphaList(),
      floatingActionButton: CircleAvatar(
        backgroundColor: AppColors.mainColor,
        radius: 28,
        child: IconButton(
          icon: const Icon(Icons.add,color: AppColors.white,),
          onPressed: () {
            showAddSphaDialog(context); // دلوقتي ال dialog هيلاقي AddSphaCubit
          },
        ),
      ),
    );
  }
}
