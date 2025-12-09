import 'package:flutter/material.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_colom.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_container.dart';

class CustomGridView extends StatelessWidget {
   CustomGridView({super.key});
final List<Map<String, String>> items = [
  {
    "title": "القرآن الكريم",
    "image": "assets/images/mosque.png",
    "widget": AppRoutes.quran
    
  },
  {
    "title": "الأذكار",
    "image": "assets/images/islamic.png",
       "widget": AppRoutes.azkar
  },
  {
    "title": "المسبحه",
    "image": "assets/images/rosary.png",
       "widget": AppRoutes.sphaView
  },
  {
    "title": " ادعيه ",
    "image": "assets/images/window.png",
       "widget": AppRoutes.azkar
  },
];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
     padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // عدد العناصر في الصف
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 9/8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
      final item = items[index];
      
      return CustomContainer(
        title: item["title"]!,
widget: item["widget"]!,
child:CustomColom(title: item["title"]!, imagePath: item["image"]!),
       
      );
        },
      ),
    );

  }
}