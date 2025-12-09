import 'package:flutter/material.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';


import 'package:zker/features/home_feature/presentation/views/widgets/azkar_details_list.dart';

class AzkarDetailsView extends StatelessWidget {
  const AzkarDetailsView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,title),
      body: 
     
        AzkarDetailsList(),
      
    );
  }
}
