import 'package:flutter/material.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_item_entity.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/azkar_detail_container.dart';

class AzkarDetailsList extends StatelessWidget {
  const AzkarDetailsList({super.key, required this.azkarItemEntity, required this.length});
final AzkarItemEntity azkarItemEntity;
final int length;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: length,
        itemBuilder: (context, index) {
          
      
        return AzkarDetailContainer(azkarItemEntity: azkarItemEntity,);
      },),
    );
  }
}