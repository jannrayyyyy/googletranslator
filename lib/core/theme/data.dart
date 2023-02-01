import 'package:flutter/material.dart';

class CustomThemeData {
  static ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        selectedItemColor: Colors.black,
      ),
    );
  }
}
