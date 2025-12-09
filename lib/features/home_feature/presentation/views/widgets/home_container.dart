import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(12),
  
        decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.4), // ✅ الشفافية
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: AppColors.mainColor, // ✅ لون البوردر
        width: .5,
      ),
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
      ],
        ),
      ),
    )
;
  }
}