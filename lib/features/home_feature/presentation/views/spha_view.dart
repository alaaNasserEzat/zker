import 'package:flutter/material.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/spha_container.dart';

class SphaView extends StatelessWidget {
  const SphaView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SphaContainer()
            );
          },
        ),
      ),
    );
  }
}
