import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/routs/go_route.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/azkar_category_cubit/azkar_category_cubit.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/azkar_category_cubit/azkar_category_state.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/azkar_category_container.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_container.dart';

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
          return Directionality(
            textDirection: TextDirection.rtl,
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return AzkarCategoryContainer(
                  title: state.categories[index].category,
                  onTap: () {
                    context.push(
                      AppRoutes.azkarDetails,
                      extra: state.categories[index],
                    );
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          state.categories[index].category,
                          style: AppTextStyles.zekerTextBold18,
                        ),
                      ),
                    ),
                  ),
                );
            
                  
              },
            ),
          );
        }

        if (state is AzkarCategoryError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}
