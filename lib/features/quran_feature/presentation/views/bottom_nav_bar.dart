import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_texts.dart';
import 'package:zker/features/home_feature/presentation/views/home_view.dart';
import 'package:zker/features/quran_feature/presentation/views/quran_view.dart';
import 'package:zker/features/quran_feature/presentation/views/surah_list_view.dart';


class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int currentIndex = 0;
List<Widget> screens = [HomeView(),SurahListView(),SurahListView(),SurahListView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true, // ✅ دي أهم سطر
body: screens[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            //Colors.white.withOpacity(.8),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomItem(
                index: 0,
                icon: Icons.home,
                text: AppTexts.home,
              ),
              bottomItem(
                index: 1,
                icon: Icons.favorite,
                text: AppTexts.favorite,
              ),
              bottomItem(
                index: 2,
                icon: Icons.shopping_cart,
                text: AppTexts.cart,
              ),
              bottomItem(
                index: 3,
                icon: Icons.person,
                text: AppTexts.profile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomItem({
    required int index,
    required IconData icon,
    required String text,
  }) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected
                ? AppColors.darkPink
                : AppColors.white,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? AppColors.darkPink
                  : AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
