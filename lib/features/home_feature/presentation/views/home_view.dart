import 'package:flutter/material.dart';

import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/widgets/custom_shadow_contanier.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/home_category_row.dart';

import 'package:zker/features/home_feature/presentation/views/widgets/prayer_time_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 10),
              //Text("ذِكْر", style: AppTextStyles.zekerTitle),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    "assets/images/m.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor.withOpacity(.90),
                    ),
                  ),
                PrayerTimeSection(),
                  Positioned(
                    top: 270,
                    right: 25,
                    left: 25,
        
                    child:  CustomShadowContanier(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          spacing: 30,
                          children: [
                        HomeCategoryRow(),
                     
                               
                        
                          ],
                        ),
                      ),
                    )),
              
                ],
              ),
      
SizedBox(height: 100,),

            ],
          ),
        ),
      ),
    );
  }
}
