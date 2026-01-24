import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_category_entity.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/azkar_category_cubit/azkar_category_cubit.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/azkar_cubit.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/azkar_detail_bloc_builder.dart';



class AzkarDetailsView extends StatelessWidget {
  const AzkarDetailsView({super.key, required this.azkarCategoryEntity});

  final AzkarCategoryEntity azkarCategoryEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context:context),
      body: 
     
        AzkarDetailBody(azkarCategoryEntity: azkarCategoryEntity,),
      
    );
  }
}
