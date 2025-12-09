import 'package:flutter/material.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/azkar_detail_container.dart';

class AzkarDetailsList extends StatelessWidget {
  const AzkarDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          
      
        return AzkarDetailContainer();
      },),
    );
  }
}