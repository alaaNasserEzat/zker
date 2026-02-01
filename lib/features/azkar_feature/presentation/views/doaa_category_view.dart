import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/doaa_cubit.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/doaa_category_bloc_builder.dart';

class DoaaCategoryView extends StatelessWidget {
  const DoaaCategoryView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DoaaCubit>()..getCategoryDoaa(),
      child: Scaffold(
        appBar: buildAppBar(context:  context,title: "ادعيه"),
        body: DoaaCategoryBlocBuilder()
      ),
    );
  }
}