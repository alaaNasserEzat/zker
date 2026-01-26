import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_item_entity.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_btn.dart';

class AzkarDetailContainer extends StatefulWidget {
  const AzkarDetailContainer({super.key, required this.azkarItemEntity});
  final AzkarItemEntity azkarItemEntity;

  @override
  State<AzkarDetailContainer> createState() => _AzkarDetailContainerState();
}

class _AzkarDetailContainerState extends State<AzkarDetailContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(.5, .5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      SharePlus.instance.share(
                        ShareParams(
                          text: widget.azkarItemEntity.text,
                        ),
                      );
                    },
                    child: Icon(Icons.share, color: AppColors.mainColor),
                  ),

                  SizedBox(width: 10),
                  Icon(Icons.favorite, color: AppColors.mainColor),
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
                textDirection: TextDirection.rtl,
                widget.azkarItemEntity.text,
              ),
              Divider(
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
