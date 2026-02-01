import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zker/core/services/location_service.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/core/widgets/custom_shadow_contanier.dart';
import 'package:zker/features/home_feature/data/data_source/home_data_source.dart';
import 'package:zker/features/home_feature/data/repo_imp/home_repo_impl.dart';
import 'package:zker/features/home_feature/domain/use_cases/get_prayer_time_use_case.dart';
import 'package:zker/features/home_feature/presentation/cubits/prayer_time_cubit.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/home_category_row.dart';

import 'package:zker/features/home_feature/presentation/views/widgets/prayer_row_widget.dart';

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
                 Column(
                  
                  children: [
                    SizedBox(height: 30,),
                     Text(
                    "باقي علي صلاه الفجر",
                    style: AppTextStyles.zekerTitle,
                  ),
                  Text("10:33:00", style: AppTextStyles.zekerTitle),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Divider(thickness: .5,color: AppColors.white,),
                     ),
                                 BlocProvider(
                                                 create: (context) => PrayerCubit(
                                 GetPrayerTimeUseCase(
                                   HomeRepoImpl(
                                     homeDataSource: HomeDataSourceImpl(
                                       locationService: LocationService(),
                                     ),
                                   ),
                                 ),
                                                 )..loadPrayerTimes(),
                                                 child: PrayerRowWidget(),
                                               ),
                 
                  ],
                 ),
                  Positioned(
                    top: 270,
                    right: 25,
                    left: 25,
        
                    child:  CustomShadowContanier(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          spacing: 20,
                          children: [
                        HomeCategoryRow(),
                        HomeCategoryRow()
                               
                        
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
