import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/features/home_feature/presentation/views/azkar_view.dart';
import 'package:zker/features/quran_feature/presentation/cubits/auran_cubit.dart';

import 'package:zker/features/quran_feature/presentation/views/widgets/sura_item.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<QuranCubit>()..loadQuran(),
      child: Scaffold(
        appBar: buildAppBar(context,"القران الكريم"),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: GridView.builder(
            itemCount: 114,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              return SuraItem(surah: index);
            },
          ),
        ),
      ),
    );
  }
}
