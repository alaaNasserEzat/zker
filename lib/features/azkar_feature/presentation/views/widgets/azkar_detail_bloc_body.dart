import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/features/azkar_feature/domain/entites/azkar_category_entity.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/azkar_detail_container.dart';
import 'package:zker/features/azkar_feature/presentation/views/widgets/finish_dilog.dart';

class AzkarDetailBody extends StatefulWidget {
  const AzkarDetailBody({super.key, required this.azkarCategoryEntity});
  final AzkarCategoryEntity azkarCategoryEntity;

  @override
  State<AzkarDetailBody> createState() => _AzkarDetailBodyState();
}

class _AzkarDetailBodyState extends State<AzkarDetailBody> {
  bool _isFinishedShown=false;double get totalProgress {
  int totalCount = widget.azkarCategoryEntity.azkar
      .fold(0, (sum, item) => sum + item.count);

  int totalCurrent = widget.azkarCategoryEntity.azkar
      .fold(0, (sum, item) => sum + item.currCount);

  if (totalCount == 0) return 0;

  double progress = totalCurrent / totalCount;

  if (progress == 1 && !_isFinishedShown) {
    _isFinishedShown = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showFinishDialog(context,widget.azkarCategoryEntity.category);
    });
  }

  return progress;
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
               LinearProgressIndicator(
              minHeight: 5,
              value: totalProgress.clamp(0, 1),
            color: AppColors.green,backgroundColor: AppColors.grey,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.heightOf(context) * 0.83,
            child: ListView.builder(
              itemCount: widget.azkarCategoryEntity.azkar.length,
              itemBuilder: (context, index) {
                return AzkarDetailContainer(
                  azkarItemEntity: widget.azkarCategoryEntity.azkar[index],
                  onCountChanged: (){
                    setState(() {
                      
                    });
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
