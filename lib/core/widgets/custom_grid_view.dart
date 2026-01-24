import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.item, required this.length});
final Widget item;
final int length;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
  padding: const EdgeInsets.all(16),
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200, // أقصى عرض للكارد
    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
    childAspectRatio: 0.85,
  ),
  itemCount: length,
  itemBuilder: (context, index) {
    return item;
  },
);

  }
}