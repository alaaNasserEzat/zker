import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/core/widgets/custom_shadow_contanier.dart';
import 'package:zker/core/widgets/snack_bar.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_item_entity.dart';
import 'package:zker/features/favourite/data/models/favourite_item_model.dart';
import 'package:zker/features/favourite/presentation/cubits/favourite_cubit.dart';
import 'package:zker/features/favourite/presentation/cubits/favourite_state.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_btn.dart';

class AzkarDetailContainer extends StatefulWidget {
  const AzkarDetailContainer({
    super.key,
    required this.azkarItemEntity,
    required this.onCountChanged,
    required this.categoryId,
  });
  final AzkarItemEntity azkarItemEntity;
  final int categoryId;

  final VoidCallback onCountChanged;

  @override
  State<AzkarDetailContainer> createState() => _AzkarDetailContainerState();
}

class _AzkarDetailContainerState extends State<AzkarDetailContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomShadowContanier(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      SharePlus.instance.share(
                        ShareParams(text: widget.azkarItemEntity.text),
                      );
                    },
                    child: Icon(Icons.share, color: AppColors.mainColor),
                  ),

                  SizedBox(width: 10),
                  BlocConsumer<FavouriteCubit, FavouriteState>(
                    builder: (context, state) {
                      final favCubit = context.read<FavouriteCubit>();

                      final isFav = favCubit.isFavourite(
                        FavouriteItemModel(
                          id: widget.azkarItemEntity.id,
                          text: widget.azkarItemEntity.text,
                          categoryId: widget.categoryId,
                          // azkar مفيهاش صورة
                        ),
                      );

                      return GestureDetector(
                        onTap: () {
                          final favItem = FavouriteItemModel(
                            id: widget.azkarItemEntity.id,
                            text: widget.azkarItemEntity.text,
                            categoryId: widget.categoryId,
                          );

                          if (isFav) {
                            favCubit.removeFromFavourite(favItem);
                            showSankBar(context, "تمت ازالتها من المفضله");
                          } else {
                            favCubit.addToFavourite(favItem);
                            showSankBar(context, "تمت الاضافه الي المفضله");
                          }
                        },
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav
                              ? AppColors.mainColor
                              : AppColors.mainColor,
                        ),
                      );
                    },

                    listener: (BuildContext context, FavouriteState state) {
                      // if(state is AddToFavouriteState){
                      //   showSankBar(context, "تمت الاضافه الي المفضله");
                      // }
                      // if(state is RemoveFromFavouriteState){
                      //   showSankBar(context, "تمت ازالتها من المفضله");
                      // }
                    },
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: AppColors.darkPink,
                    radius: 20,
                    child: Text(
                      widget.azkarItemEntity.id.toString(),
                      style: AppTextStyles.titles.copyWith(
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                widget.azkarItemEntity.text,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Divider(
                thickness: 1.5,
                color: AppColors.mainColor,
                radius: BorderRadius.circular(16),
              ),
              CustomBtn(
                title:
                    "${widget.azkarItemEntity.currCount}/${widget.azkarItemEntity.count}",
                onTap: () {
                  setState(() {
                    if (widget.azkarItemEntity.currCount <
                        widget.azkarItemEntity.count) {
                      widget.azkarItemEntity.currCount += 1;
                    }
                    widget.onCountChanged();
                    print(
                      "+++++++++++++++++++++++++++++${widget.azkarItemEntity.currCount}",
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
