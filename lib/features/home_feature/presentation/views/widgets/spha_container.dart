import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';

class SphaContainer extends StatelessWidget {
  const SphaContainer({super.key, required this.sphaModel});
final SphaEntity sphaModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRoutes.sphaDetailsView,extra: "سبحان الله");
      },
      child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(.5, .5),
                        blurRadius: 10,
                      ),
                    ],
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Image.asset(
                          "assets/images/rosary.png",
                          width: 40,
                          height: 30,
                        ),
                           const SizedBox(width: 10),
                        Text(sphaModel.name, style: AppTextStyles.titles),
                        Spacer(),
                    
                     
                    
                        Text(sphaModel.beadsCount.toString(), style: AppTextStyles.titles),
                      ],
                    ),
                  ),
                ),
    );
  }
}