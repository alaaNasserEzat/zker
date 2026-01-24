import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_category_entity.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/azkar_cubit.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/azkar_state.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/azkar_detail_container.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/azkar_details_list.dart';

class AzkarDetailBody extends StatelessWidget {
  const AzkarDetailBody({super.key, required this.azkarCategoryEntity});
final AzkarCategoryEntity azkarCategoryEntity;
  @override
  Widget build(BuildContext context) {

  
            return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: azkarCategoryEntity.azkar.length,
        itemBuilder: (context, index) {
        return AzkarDetailContainer(azkarItemEntity: azkarCategoryEntity.azkar[index],);
      },),);
          }

       


        
    
  }
