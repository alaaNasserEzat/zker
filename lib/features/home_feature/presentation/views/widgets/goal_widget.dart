import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/routs/app_routs.dart';
import 'package:zker/core/routs/go_route.dart';
import 'package:zker/core/widgets/custom_shadow_contanier.dart';

class GoalWidget extends StatelessWidget {
  const GoalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShadowContanier(
      child: InkWell(
        onTap: () {
          context.push(AppRoutes.goalsView);
        },
        child: Row(children: [Text("اهدافي")]),
      ),
    );
  }
}
