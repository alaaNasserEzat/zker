import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_category_entity.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/azkar_detail_bloc_body.dart';



class AzkarDetailsView extends StatelessWidget {
  const AzkarDetailsView({super.key, required this.azkarCategoryEntity});

  final AzkarCategoryEntity azkarCategoryEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context:context,title: azkarCategoryEntity.category ),
      body: 
     
        AzkarDetailBody(azkarCategoryEntity: azkarCategoryEntity,),
      
    );
  }
}
