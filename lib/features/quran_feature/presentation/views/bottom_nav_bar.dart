import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_texts.dart';
import 'package:zker/features/favourite/presentation/views/favourite_view.dart';
import 'package:zker/features/home_feature/presentation/views/home_view.dart';
import 'package:zker/features/home_feature/presentation/views/prayer_time_view.dart';
import 'package:zker/features/profile_feature/presentation/views/profile_view.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeView(),
    FavouriteView(),
    PrayerTimeView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            //Colors.white.withOpacity(.8),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomItem(index: 0, icon: Icons.home, text: AppTexts.home),
              bottomItem(
                index: 1,
                icon: Icons.favorite_border_outlined,
                text: AppTexts.favorite,
              ),
              bottomItem(
                index: 2,
                icon: Icons.timer_outlined,
                text: AppTexts.cart,
              ),
              bottomItem(
                index: 3,
                icon: Icons.person_outline_rounded,
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
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            padding: EdgeInsets.only(top: 2, bottom: 2),
            decoration: isSelected
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  )
                : null,
            child: Icon(
              icon,
              size: 20,
              color: isSelected
                  ? AppColors.white
                  : Theme.of(context).colorScheme.primary,
            ),
          ),

          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
