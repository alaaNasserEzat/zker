import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/presentation/delete_spha_cubit/delete_spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/get_spha_cubit/spha_cubit.dart';

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
                      spacing: 5,
                      children: [
                        Image.asset(
                          "assets/images/rosary.png",
                          width: 40,
                          height: 30,
                        ),
                       
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            
                            children: [
                         Text(
                          textAlign: TextAlign.center,
                          sphaModel.name, style: AppTextStyles.titles),
                           Text("(${sphaModel.beadsCount.toString()})", style: AppTextStyles.titles.copyWith(fontSize: 20)),
                       
                            ],
                          ),
                        ),
                      //  Spacer(),
                    
                     IconButton(onPressed: ()async{
await BlocProvider.of<DeleteSphaCubit>(context).delete(sphaModel.id);

                     }, icon: Icon(Icons.delete_outlined,color: AppColors.mainColor,),)
                    
                       
                      ],
                    ),
                  ),
                ),
    );
  }
}