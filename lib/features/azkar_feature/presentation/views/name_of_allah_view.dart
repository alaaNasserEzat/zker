import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/core/widgets/custom_shadow_contanier.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/name_of_allah_cubit/name_of_allah_cubit.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/name_of_allah_cubit/name_of_allah_state.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/name_alla_describtion.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/back_icon_widgets.dart';
import 'package:zker/l10n/app_localizations.dart';

class NameOfAllahView extends StatelessWidget {
  const NameOfAllahView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: AppLocalizations.of(context)!.namesOfAllah,
      ),
      body: BlocBuilder<NameOfAllahCubit, NameOfAllahState>(
        builder: (context, state) {
          if (state is NameOfAllahLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NameOfAllahError) {
            return Center(child: Text(state.message));
          }

          if (state is NameOfAllahLoaded) {
            return GridView.builder(
              itemCount: state.nameAllahList.length,
              itemBuilder: (context, index) {
                final item = state.nameAllahList[index];
                return InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return showNameDes(
                          context,
                          item.name,
                          item.description,
                        );
                      },
                    );
                  },
                  child: CustomShadowContanier(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [Text(item.name), BackIconWidgets()],
                    ),
                  ),
                );
              },

              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
