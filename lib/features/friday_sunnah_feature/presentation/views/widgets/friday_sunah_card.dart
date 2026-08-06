import 'package:flutter/material.dart';
import 'package:zker/features/friday_sunnah_feature/data/models/friday_sunnah_model.dart';

class FridaySunnahCard extends StatelessWidget {
  const FridaySunnahCard({super.key, required this.item});

  final FridaySunnahModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: const Icon(Icons.mosque_outlined),
        ),
        title: Text(
          item.name,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(item.description),
        ),
      ),
    );
  }
}
