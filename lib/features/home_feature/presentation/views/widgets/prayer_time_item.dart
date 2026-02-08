import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';

class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem({super.key, required this.text, required this.time, required this.img,  this.iscurrentPrayer=false});
 final String text;
 final String img;
final String time;
 final bool iscurrentPrayer ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        // decoration: BoxDecoration(
        //   color: AppColors.white,
        //   boxShadow: [BoxShadow(color: Color(0x40000000), offset: Offset(0, 1), blurRadius: 4)],
        //  // gradient: LinearGradient(colors: [AppColors.pink, AppColors.darkPink,AppColors.white], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        //   ///color: Colors.transparent,
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        //   // border: Border.all(color: AppColors.mainColor,width: .5),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Text(
              text,
                style: TextStyle(
                  fontSize: 15,
                  color:iscurrentPrayer?AppColors.orange: AppColors.white

                ),
              ),
          // Image.asset(img,width: 50,height: 30,),
          SvgPicture.asset(img,width: 25,height: 25,color: iscurrentPrayer?AppColors.orange:AppColors.white,),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color:iscurrentPrayer?AppColors.orange: AppColors.white,
                          fontFamily: FontFamily.cairo,
                          fontWeight: FontWeight.w400
                      
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}