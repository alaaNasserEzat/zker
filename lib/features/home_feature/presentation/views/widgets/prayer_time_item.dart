import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';

class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem({super.key, required this.text, required this.time, required this.img});
 final String text;
 final String img;
final String time;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 3,right: 3),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.pink, AppColors.darkPink,AppColors.white], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ///color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: AppColors.mainColor,width: .5),
        ),
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

                ),
              ),
           Image.asset(img,width: 50,height: 30,),
              Text(
                time,
                style: TextStyle(
                  fontSize: 10,
                          fontFamily: "Nunito",
                      fontVariations: [FontVariation('wght', 900)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}