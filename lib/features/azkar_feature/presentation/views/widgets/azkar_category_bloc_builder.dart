import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/azkar_category_cubit/azkar_category_cubit.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/azkar_category_cubit/azkar_category_state.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/azkar_category_container.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/azker_category_grid_view.dart';
class AzkarCategoryBlocBuilder extends StatelessWidget {
  const AzkarCategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCategoryCubit, AzkarCategoryState>(
      builder: (context, state) {
        if (state is AzkarCategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AzkarCategoryLoaded) {
          return AzkerCategoryGridView(categories: state.categories);
           //Directionality(
           // textDirection: TextDirection.rtl,
          //   child: GridView.builder(
          //     padding: const EdgeInsets.all(16),
          //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //       maxCrossAxisExtent: 200,
          //       mainAxisSpacing: 16,
          //       crossAxisSpacing: 16,
          //       childAspectRatio: 0.9,
          //     ),
          //     itemCount: state.categories.length,
          //     itemBuilder: (context, index) {
          //       return AzkarCategoryContainer(
          //         title: state.categories[index].category,
          //         onTap: () {
          //           context.push(
          //             AppRoutes.azkarDetails,
          //             extra: state.categories[index],
          //           );
          //         },
          //         child: Center(
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 Text(state.categories[index].image??"" ,style: AppTextStyles.zekerTextBold18.copyWith(fontSize: 30),),
          //                 Text(
          //                   textAlign: TextAlign.center,
          //                   state.categories[index].category,
          //                   style: AppTextStyles.zekerTextBold18,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
            
                  
          //     },
          //   ),
          // );
        }

        if (state is AzkarCategoryError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}
