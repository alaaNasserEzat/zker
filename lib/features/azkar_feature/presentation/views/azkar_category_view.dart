import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/azkar_category_cubit/azkar_category_cubit.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/azkar_category_bloc_builder.dart';

class AzkarCategoryView extends StatelessWidget {
  const AzkarCategoryView({super.key,});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => sl<AzkarCategoryCubit>()..getCategories(),
      child: Scaffold(
        appBar: buildAppBar(context:  context,title: "ازكار" ),
        body: AzkarCategoryBlocBuilder()
      ),
    );
  }
}