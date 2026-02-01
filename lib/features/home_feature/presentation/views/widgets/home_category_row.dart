import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/utils/app_image.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_colom.dart';

class HomeCategoryRow extends StatelessWidget {
  const HomeCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomColom(    title: "القرآن الكريم",
                            imagePath: AppImage.quran,
                            onTap: (){
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
                                        CustomColom(    title: "سبحه ",
                            imagePath: AppImage.spha,
                               onTap: (){
                              context.push(AppRoutes.sphaView);
                            },
                            ),
                              ],
                            );
  }
}