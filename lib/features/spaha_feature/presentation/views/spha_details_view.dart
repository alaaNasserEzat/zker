import 'package:flutter/material.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/back_ground_image.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/presentation/views/widgets/spha_details_bloc_widget.dart';

class SphaDetailsView extends StatelessWidget {
  const SphaDetailsView({super.key, required this.sphaEntity});
final SphaEntity sphaEntity;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(context:context),
      body: Stack(
        children: [
          BackGroundImage(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: SphaDetailsBlocWidget(sphaEntity: sphaEntity)
            ),
          ),
        ],
      ),
    );
  }
}