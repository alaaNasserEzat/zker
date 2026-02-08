import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/routs/go_route.dart';
import 'package:zker/core/utils/app_image.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_colom.dart';

class HomeCategoryRow extends StatelessWidget {
  const HomeCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CustomColom(    title: "القرآن الكريم",
                            imagePath: AppImage.quran,
                            onTap: (){
                              print("pppppppppppppppp");
                              context.push(AppRoutes.quran);
                            },
                            ),
                                   CustomColom(    title: "ادعيه ",
                            imagePath:AppImage.dua,
                          onTap: (){
                              context.push(AppRoutes.doaaCategoryView);
                            },
                            ),
                                   CustomColom(    title: "ازكار ",
                            imagePath: AppImage.azkar,
                               onTap: (){
                              context.push(AppRoutes.azkarCategoryView);
                            },
                            ),
                                  ],
                                ),
                                       Row(

                                        children: [
                                           CustomColom(    title: "سبحه ",
                            imagePath: AppImage.spha,
                               onTap: (){
                              context.push(AppRoutes.sphaView);
                            },
                            ),
  
                                   CustomColom(    title: "اسماء الله",
                            imagePath:AppImage.allah,
                          onTap: (){
                            context.push(AppRoutes.nameOfAllahView);
                            },
                            ),
                                   CustomColom(    title: "سنن الجمعه ",
                            imagePath: AppImage.mosque,
                               onTap: (){
                   
                            },
                            ),
                                        ],
                                       )
     
                              ],
                            );
  }
}