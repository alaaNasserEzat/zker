import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        }

        if (state is AzkarCategoryError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}
