import 'package:flutter/material.dart';

getDarkThem(){
  return ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: const Color.fromARGB(255, 87, 119, 129),
    brightness: Brightness.dark,
    textTheme: ThemeData.light().textTheme.apply(bodyColor: Colors.black),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      
      elevation: 0,
      iconTheme: IconThemeData(
        
        color: Colors.black
      )
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.blueGrey,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey
    ),
  );
}