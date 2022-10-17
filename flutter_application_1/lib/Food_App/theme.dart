import 'package:flutter/material.dart';

class FoodTheme {
  late ThemeData theme;

  FoodTheme() {
    theme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      ),
      tabBarTheme: const TabBarTheme(labelColor: Colors.black),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 76, 175, 155)),
    );
  }
}
