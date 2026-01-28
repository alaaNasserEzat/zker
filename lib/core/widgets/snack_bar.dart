import 'package:flutter/material.dart';


showSankBar(BuildContext context,String text){
  return  ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text(text)),
              );
}