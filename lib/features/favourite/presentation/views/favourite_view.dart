import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/core/widgets/custom_shadow_contanier.dart';
import 'package:zker/features/favourite/presentation/cubits/favourite_cubit.dart';
import 'package:zker/features/favourite/presentation/cubits/favourite_state.dart';
import 'package:zker/features/favourite/presentation/views/empty_favourite_view.dart';
import 'package:zker/l10n/app_localizations.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FavouriteCubit>()..getFavourites(),
      child: Scaffold(
        appBar: buildAppBar(
          context: context,
          title: AppLocalizations.of(context)!.favorites,
        ),
        body: BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            if (state is FavouriteLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is FavouriteError) {
              return Center(child: Text(state.error.message));
            }

            if (state is FavouriteLoaded) {
              if (state.favourites.isEmpty) {
                return const EmptyFavouriteView();
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: state.favourites.length,
                  itemBuilder: (context, index) {
                    final favourite = state.favourites[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomShadowContanier(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.delete_outline_rounded,
                                  color: AppColors.mainColor,
                                ),
                                onPressed: () {
                                  context
                                      .read<FavouriteCubit>()
                                      .removeFromFavourite(favourite);
                                },
                              ),
                              Text(
                                favourite.text,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
