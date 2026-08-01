import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_text_styles.dart';

Widget showNameDes(BuildContext context, String title, String des) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(30),
    ),
    title: Center(child: Text(title)),
    content: Text(des, textAlign: TextAlign.center),
  );
}
