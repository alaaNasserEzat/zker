import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 1),
                blurRadius: 4,
            )],
        color: Colors.white, // ✅ الشفافية
        borderRadius: BorderRadius.circular(16),
     
          ),
        
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
        children: [
          // ✅ IMAGE
          Container(
            width: 60,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/quran.png",
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
        
          const SizedBox(width: 12),
        
          // ✅ TEXT
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "اهلا بك",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "لا تنس قراء ؤردك اليوم",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Spacer(),
          CircleAvatar(
            backgroundColor: AppColors.mainColor60,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Icon(Icons.arrow_back_ios, color: AppColors.mainColor,)),
          )
        ],
          ),
        ),
      ),
    )
;
  }
}