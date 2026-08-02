import 'package:flutter/material.dart';
import 'package:zker/l10n/app_localizations.dart';

class EmptyFavouriteView extends StatelessWidget {
  const EmptyFavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80),
          SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.noFavorites,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
