import 'package:flutter/material.dart';

class ContainerImageBackground extends StatelessWidget {
  const ContainerImageBackground({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 350,

      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Image.asset(
          "assets/images/m.jpg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: 350,
        ),
      ),
    );
  }
}

class c extends StatelessWidget {
  const c({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 350,
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Theme.of(context).colorScheme.surfaceContainer,
        // AppColors.mainColor.withOpacity(.90),
      ),
    );
  }
}
