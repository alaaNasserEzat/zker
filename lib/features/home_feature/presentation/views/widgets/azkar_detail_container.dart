import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_btn.dart';

class AzkarDetailContainer extends StatelessWidget {
  const AzkarDetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                        Icon(Icons.share,color: AppColors.mainColor,),
                        SizedBox(width: 10,),
                        Icon(Icons.favorite,color: AppColors.mainColor,),
                        Spacer(),
                        CircleAvatar(backgroundColor: AppColors.darkPink,radius: 20,child: Text("1",style: AppTextStyles.titles.copyWith(color: AppColors.mainColor),),)
                      ],
                    ),
                    Text(
                      textDirection: TextDirection.rtl,         "﴿اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَن ذَا الَّذِي يَشْفَعُ عِندَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ﴾"),
                    Divider(color: AppColors.mainColor,radius: BorderRadius.circular(16),),
                    CustomBtn()
                    ]),
                ),
              ),
    );
  }
}