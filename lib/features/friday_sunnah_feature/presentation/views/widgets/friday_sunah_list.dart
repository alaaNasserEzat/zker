import 'package:flutter/material.dart';
import 'package:zker/features/friday_sunnah_feature/presentation/views/widgets/friday_sunah_card.dart';
import 'package:zker/features/friday_sunnah_feature/presentation/views/widgets/friday_sunah_header.dart';

class FridaySunahList extends StatelessWidget {
  const FridaySunahList({super.key, this.items});
  final items;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: FridaySunnahHeader()),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return FridaySunnahCard(item: items[index]);
            }, childCount: items.length),
          ),
        ),
      ],
    );
  }
}
