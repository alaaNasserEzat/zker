import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zker/core/utils/app_colors.dart';

class SketonaizerPrayerTime extends StatelessWidget {
  const SketonaizerPrayerTime({super.key});

  @override
  Widget build(BuildContext context) {
    return  Skeletonizer(
      enabled: true,
      child: ListView.builder
      (
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          
          return Padding(
            padding: const EdgeInsets.only(right: 8.0,left: 8),
            child: Container(
              decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [AppColors.pink, AppColors.darkPink,AppColors.white], begin: Alignment.topCenter, end: Alignment.bottomCenter),
         
                          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: AppColors.mainColor,width: .5),
              ),
              child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Text(
              "text",
                style: TextStyle(
                  fontSize: 15,

                ),
              ),
           Image.asset("assets/images/day.png",width: 50,height: 30,),
              Text(
                "3:09",
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
        },
      ),
    );
  }
}