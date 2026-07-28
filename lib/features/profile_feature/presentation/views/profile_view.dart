
import 'package:flutter/material.dart';
import 'package:zker/features/profile_feature/presentation/views/widgets/custom_list_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
           CustomListTile()
          ],
        ),
      )
    );
  }
}