import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';

class AzkarCategoryContainer extends StatelessWidget {
  const AzkarCategoryContainer({super.key, required this.child, required this.title,  required this.onTap});
final Widget child;
final String title;
final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(

        children: [
          Container(
              decoration: BoxDecoration(
               color: AppColors.white,
  // gradient: LinearGradient(
  //               begin: Alignment.topLeft,
  //               end: Alignment.bottomRight,
  //               colors: [
  //                 AppColors.mainColor.withOpacity(0.8),
  //                 AppColors.mainColor.withOpacity(0.6),
  //                 AppColors.mainColor.withOpacity(0.4),
  //                 Colors.white.withOpacity(0.2),
  //               ],
              
  //             ),
                borderRadius: BorderRadius.circular(15),
              boxShadow: const [
      BoxShadow(
        color: Colors.black26, // اضبط الشادو عشان يكون واضح
        offset: Offset(0, 2),
        blurRadius: 4,

      ),
    ],
  
              ),
              child: child,
            ),
            // Positioned(
            //   top: 8,
            //   right: 8,
            //   child: CircleAvatar(
            //     radius: 15,
            //     backgroundColor: AppColors.green,
            //     child: Icon(Icons.check, color: AppColors.white,size: 25,),
               
            //   ),
            // )
        ],
      ),
    );
  }
}