import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/back_ground_image.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/circle_present_indecator.dart';

class SphaDetailsView extends StatelessWidget {
  const SphaDetailsView({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(context, title),
      body: Stack(
        children: [
          BackGroundImage(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              textDirection: TextDirection.rtl,
              spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Text("سبحان الله", style: AppTextStyles.titles,),
   
                Row(
                  children: [
            Text("عدد الحبات 33",style: AppTextStyles.titles,),
            Spacer(),
            Text("عدد الدورات  33",style: AppTextStyles.titles,),
            
                  ],
                ),
                CirclePresentIndecator(),
                 Text(" العدد الكلي  1000", style: AppTextStyles.titles,),
            
              ],
            ),
          ),
        ],
      ),
    );
  }
}